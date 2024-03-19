import 'package:developer_company/data/models/common/image_model.dart';

abstract class UploadImageRepository {
  Future<ImageToUpload> postImage(UploadImage imageRequest);
}
