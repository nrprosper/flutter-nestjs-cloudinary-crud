import { HydratedDocument } from 'mongoose';
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';

export type CategoryDocument = HydratedDocument<Category>;

@Schema()
export class Category {

  @Prop()
  name: string;

  @Prop()
  description?: string;

  @Prop()
  image: string;

}


export const CategorySchema = SchemaFactory.createForClass(Category);
