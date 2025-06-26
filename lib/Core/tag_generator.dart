class TagGenerator {
  static List<Map<String, String>> generateList(String tagID, int length) {
    return List.generate(
      length,
      (index) => {
        'Image': '${tagID}Image${index + 1}',
        'Title': '${tagID}Title${index + 1}',
        'InterviewDate': '${tagID}InterviewDate${index + 1}',
        'CourseDate': '${tagID}CourseDate${index + 1}',
        'Duration': '${tagID}Duration${index + 1}',
        'Counter': '${tagID}Counter${index + 1}',
        'Location': '${tagID}Location${index + 1}',
      },
    );
  }

  static Map<String, String> generateMap(String tagID, int index) {
    return {
      'Image': '${tagID}Image$index',
      'Title': '${tagID}Title$index',
      'InterviewDate': '${tagID}InterviewDate$index',
      'CourseDate': '${tagID}CourseDate$index',
      'Duration': '${tagID}Duration$index',
      'Counter': '${tagID}Counter$index',
      'Location': '${tagID}Location$index',
    };
  }
}
