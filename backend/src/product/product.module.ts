import { Module } from '@nestjs/common';
import { ProductService } from './product.service';
import { ProductController } from './product.controller';
import { Product, ProductSchema } from './schemas/product.schema';
import { MongooseModule } from '@nestjs/mongoose';
import { CloudinaryModule } from '../cloudinary/cloudinary.module';
import { Category, CategorySchema } from '../category/schemas/category.schema';
import { CategoryModule } from '../category/category.module';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Product.name, schema: ProductSchema },
      {name: Category.name, schema: CategorySchema}
    ]),
    CloudinaryModule,
    // CategoryModule
  ],
  controllers: [ProductController],
  providers: [ProductService],
})
export class ProductModule {}
