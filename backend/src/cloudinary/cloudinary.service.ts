import { Injectable } from '@nestjs/common';
import { v2 as cloudinary } from 'cloudinary';
import {CloudinaryResponse} from "./cloudinary-response";
import * as streamifier from 'streamifier';


@Injectable()
export class CloudinaryService {

  async uploadFile(file: Express.Multer.File): Promise<CloudinaryResponse> {
    return new Promise<CloudinaryResponse>((resolve, reject) => {
      const uploadStream = cloudinary.uploader.upload_stream(
        (error, result) => {
          if (error) return reject(error);
          // @ts-ignore
          resolve(result);
        },
      );

      streamifier.createReadStream(file.buffer).pipe(uploadStream);
    });
  }

  async uploadFiles(files: Express.Multer.File[]): Promise<CloudinaryResponse[]> {
    return Promise.all(files.map(file => this.uploadFile(file)));
  }


}