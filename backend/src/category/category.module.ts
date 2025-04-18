import { Module } from '@nestjs/common';
import { CategoryService } from './category.service';
import { CategoryController } from './category.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { Category, CategorySchema } from './schemas/category.schema';
import { CloudinaryModule } from '../cloudinary/cloudinary.module';
import { MulterModule } from '@nestjs/platform-express';

@Module({
  imports: [MongooseModule.forFeature([
    {name: Category.name, schema: CategorySchema}
  ]),
    CloudinaryModule,
    MulterModule.register({
      limits: {
        fieldSize: 5 * 1024 * 1024,
      }
    })
  ],
  controllers: [CategoryController],
  providers: [CategoryService],
})
export class CategoryModule {}
