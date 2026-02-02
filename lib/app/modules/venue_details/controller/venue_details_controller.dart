import 'package:fieldify/app/core/base/base_controller.dart';
import 'package:fieldify/app/data/model/venue_model.dart';
import 'package:fieldify/app/modules/venue_details/models/review_model.dart';
import 'package:fieldify/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VenueDetailsController extends BaseController {
  final VenueModel venue = Get.arguments as VenueModel;
  
  final currentImageIndex = 0.obs;
  final isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
    isFavorite.value = venue.isFavorite ?? false;
    if (venue.imageUrls != null && venue.imageUrls!.isNotEmpty) {
      currentImageIndex.value = 0;
    }
  }

  void onImageChanged(int index) {
    currentImageIndex.value = index;
  }

  void onBackPressed() {
    Get.back();
  }

  void onFavoritePressed() {
    isFavorite.value = !isFavorite.value;
  }

  void onSharePressed() {
    assert(true);
  }

  void onLocationPressed() {
    assert(true);
  }

  void onCheckAvailabilityPressed() {
    assert(true);
  }

  void onViewAllReviewsPressed() {
    assert(true);
  }

  void onRulesAndRegulationsPressed() {
    Get.toNamed(Routes.RULES_AND_REGULATIONS);
  }

  List<String> get imageList {
    if (venue.imageUrls != null && venue.imageUrls!.isNotEmpty) {
      return venue.imageUrls!;
    }

    return [venue.imageUrl];
  }

  List<ReviewModel> get reviews {
    return [
      ReviewModel(
        id: '1',
        userName: 'László Barbara',
        userAvatar: '',
        rating: 4.0,
        comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        timeAgo: '3 days ago',
      ),
      ReviewModel(
        id: '2',
        userName: 'John Doe',
        userAvatar: '',
        rating: 3.0,
        comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        timeAgo: '1 week ago',
      ),
      ReviewModel(
        id: '3',
        userName: 'Jane Smith',
        userAvatar: '',
        rating: 5.0,
        comment: 'Great venue with excellent facilities. Highly recommended!',
        timeAgo: '2 weeks ago',
      ),
    ];
  }
}
