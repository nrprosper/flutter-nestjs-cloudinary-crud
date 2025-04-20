import { ApiProperty } from '@nestjs/swagger';
import {
  IsString,
  IsNotEmpty,
  IsNumber,
  IsPositive, IsMongoId,
} from 'class-validator';
import { Type } from 'class-transformer';

export class CreateProductDto {
  @ApiProperty({ description: 'The name of the product' })
  @IsString()
  @IsNotEmpty()
  name: string;

  @ApiProperty({ description: 'A brief description of the product' })
  @IsString()
  @IsNotEmpty()
  description: string;

  @ApiProperty({ description: 'The price of the product', example: 19.99 })
  @IsNumber()
  @IsPositive()
  @Type(() => Number)
  price: number;

  @ApiProperty({ description: 'The weight of the product in lbs', example: 2 })
  @IsNumber()
  @IsPositive()
  @Type(() => Number)
  lbs: number;

  @ApiProperty({ description: 'The category ID this product belongs to' })
  @IsMongoId()
  @IsNotEmpty()
  categoryId: string;
}