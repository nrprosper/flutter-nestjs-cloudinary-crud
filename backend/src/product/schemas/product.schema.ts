import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { HydratedDocument, Schema as MongooseSchema } from 'mongoose';
import { Category } from '../../category/schemas/category.schema';

export type ProductDocument = HydratedDocument<Product>;

@Schema({ timestamps: true })
export class Product {

  @Prop({unique: true})
  name: string;

  @Prop({required: true})
  description: string;

  @Prop({required: true})
  price: number;

  @Prop({required: true})
  lbs: number;

  @Prop({required: true})
  images: string[];

  @Prop({ type: MongooseSchema.Types.ObjectId, ref: 'Category' })
  category: Category;

}

export const ProductSchema = SchemaFactory.createForClass(Product);
