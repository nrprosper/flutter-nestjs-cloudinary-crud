import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';
import { Model } from 'mongoose';
import { Product } from './schemas/product.schema';
import { InjectModel } from '@nestjs/mongoose';
import { CloudinaryService } from '../cloudinary/cloudinary.service';
import { Category } from '../category/schemas/category.schema';
import { PaginationQueryParams } from '../common/pagination-query-params.dto';
import { PaginationResponse } from '../common/pagination-response.interface';

@Injectable()
export class ProductService {
  constructor(
    @InjectModel(Product.name)
    private readonly productModel: Model<Product>,
    private readonly cloudinaryService: CloudinaryService,
    @InjectModel(Category.name)
    private readonly categoryModel: Model<Category>,
  ) {}

  async create(
    createProductDto: CreateProductDto,
    images: Express.Multer.File[],
  ): Promise<Product> {
    const category = await this.categoryModel.findById(
      createProductDto.categoryId,
    );
    if (!category)
      throw new NotFoundException(
        `Category ${createProductDto.categoryId} not found`,
      );

    const newProduct = new this.productModel({
      ...createProductDto,
      category: createProductDto.categoryId,
      images: [],
    });

    if (images?.length) {
      const uploadResults = await this.cloudinaryService.uploadFiles(images);
      newProduct.images = uploadResults.map((r) => r.secure_url);
    }

    return await newProduct.save();
  }

  async findAll(pagination: PaginationQueryParams): Promise<PaginationResponse<Product>> {
    const { page, limit } = pagination;
    const skip = (page - 1) * limit;

    const [products, total] = await Promise.all([
      this.productModel.find()
        .skip(skip)
        .limit(limit)
        .populate('category', 'name _id')
        .exec(),
      this.productModel.countDocuments().exec()
    ]);

    return {
      data: products,
      pagination: {
        totalItems: total,
        currentPage: page,
        totalPages: Math.ceil(total / limit),
        itemsPerPage: limit,
        itemsOnCurrentPage: products.length
      }
    };
  }

  async findOne(id: string): Promise<Product> {
    const product = await this.productModel
      .findById(id)
      .populate('category', 'name _id')
      .exec();
    if (!product) throw new NotFoundException(`Product ${id} not found`);
    return product;
  }

  async findByCategory(categoryId: string, pagination: PaginationQueryParams): Promise<PaginationResponse<Product>> {
    const { page, limit } = pagination;
    const skip = (page - 1) * limit;

    const [products, total] = await Promise.all([
      this.productModel.find({ category: categoryId })
        .skip(skip)
        .limit(limit)
        .populate('category', 'name _id')
        .exec(),
      this.productModel.countDocuments({ category: categoryId }).exec()
    ]);

    return {
      data: products,
      pagination: {
        totalItems: total,
        currentPage: page,
        totalPages: Math.ceil(total / limit),
        itemsPerPage: limit,
        itemsOnCurrentPage: products.length
      }
    };
  }

  async update(
    id: string,
    updateProductDto: UpdateProductDto,
    images?: Express.Multer.File[],
  ): Promise<Product|null> {
    const { categoryId, ...updateData } = updateProductDto;

    const product = await this.productModel.findById(id);
    if (!product) {
      throw new NotFoundException(`Product with ID ${id} not found`);
    }

    if (categoryId) {
      const newCategory = await this.categoryModel.findById(categoryId);
      if (!newCategory) {
        throw new NotFoundException(`Category with ID ${categoryId} not found`);
      }

      updateData['category'] = categoryId;
    }

    if (images && images.length > 0) {
      const uploadResults = await this.cloudinaryService.uploadFiles(images);
      updateData['images'] = uploadResults.map((result) => result.secure_url);
    }

    return await this.productModel
      .findByIdAndUpdate(id, updateData, { new: true })
      .populate('category')
      .exec();
  }

  async remove(id: string):Promise<{message: string}> {
    const deletedProduct = await this.productModel.findByIdAndDelete(id).exec();
    if (!deletedProduct) {
      throw new NotFoundException(`Product with ID ${id} not found`);
    }
    return { message: 'Product deleted successfully' };
  }
}
