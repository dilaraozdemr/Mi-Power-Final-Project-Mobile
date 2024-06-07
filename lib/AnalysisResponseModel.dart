class AnalysisResponseModel {
  final String? title;
  final List<String>? imageUrls;

  AnalysisResponseModel({ this.title,  this.imageUrls});

  factory AnalysisResponseModel.fromFirestore(Map<String, dynamic> data) {
    return AnalysisResponseModel(
      title: data['title'],
      imageUrls: List<String>.from(data['image_urls']),
    );
  }
}