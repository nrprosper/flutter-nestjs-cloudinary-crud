import { Controller, Get, Version, VERSION_NEUTRAL } from '@nestjs/common';
import { AppService } from './app.service';
import { ApiOperation } from '@nestjs/swagger';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @ApiOperation({ summary: 'Default root endpoint' })
  @Version(VERSION_NEUTRAL)
  @Get()
  getRoot(): string {
    return this.appService.getHello();
  }

  @ApiOperation({ summary: 'API Health check' })
  @Version(VERSION_NEUTRAL)
  @Get('api/v1')
  getHello(): string {
    return this.appService.getHello();
  }

}
