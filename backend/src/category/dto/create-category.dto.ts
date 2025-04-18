import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, IsString } from 'class-validator';

export class CreateCategoryDto {
  @ApiProperty({description: 'The name of the category'})
  @IsNotEmpty()
  name: string;

  @ApiProperty({description: 'The description of the category'})
  @IsOptional()
  @IsString()
  description?: string;
}
