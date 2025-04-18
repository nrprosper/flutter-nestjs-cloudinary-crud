import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateCategoryDto } from './dto/create-category.dto';
import { UpdateCategoryDto } from './dto/update-category.dto';
import { InjectModel } from '@nestjs/mongoose';
import { Category } from './schemas/category.schema';
import { Model } from 'mongoose';
import { CloudinaryService } from '../cloudinary/cloudinary.service';

@Injectable()
export class CategoryService {
  constructor(
    @InjectModel(Category.name)
    private readonly categoryModel: Model<Category>,
    private readonly cloudinaryService: CloudinaryService,
  ) {}


  async create(createCategoryDto: CreateCategoryDto, image: Express.Multer.File) {
    const newCategory = new this.categoryModel({
      name: createCategoryDto.name,
      description: createCategoryDto.description,
    })

    const uploadResult = await this.cloudinaryService.uploadFile(image);
    newCategory.image = await uploadResult.secure_url;

    return newCategory.save();

  }

  async findAll() {
    return await this.categoryModel.find().exec();
  }

  async findOne(id: number) {
    const category = await this.categoryModel.findById(id).exec();
    if (!category) {
      throw new NotFoundException(`Category with ID ${id} not found`);
    }
    return category;
  }

  async update(id: string, updateCategoryDto: UpdateCategoryDto, imageFile?: Express.Multer.File) {
    const updateData = { ...updateCategoryDto };

    if (imageFile) {
      const uploadResult = await this.cloudinaryService.uploadFile(imageFile);
      updateData['image'] = uploadResult.secure_url;
    }

    const updatedCategory = await this.categoryModel
      .findByIdAndUpdate(id, updateData, { new: true })
      .exec();

    if (!updatedCategory) {
      throw new NotFoundException(`Category with ID ${id} not found`);
    }

    return updatedCategory;
  }

  async remove(id: string) {
    const deletedCategory = await this.categoryModel.findByIdAndDelete(id).exec();

    if (!deletedCategory) {
      throw new NotFoundException(`Category with ID ${id} not found`);
    }

    return { message: 'Category deleted successfully' };
  }

}
