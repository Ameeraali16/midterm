class Launch {
	String? missionName;
	String? missionId;
	List<String>? manufacturers;
	List<String>? payloadIds;
	String? wikipedia;
	String? website;
	String? twitter;
	String? description;

	Launch({this.missionName, this.missionId, this.manufacturers, this.payloadIds, this.wikipedia, this.website, this.twitter, this.description});

	Launch.fromJson(Map<String, dynamic> json) {
		missionName = json['mission_name'];
		missionId = json['mission_id'];
		manufacturers = json['manufacturers'].cast<String>();
		payloadIds = json['payload_ids'].cast<String>();
		wikipedia = json['wikipedia'];
		website = json['website'];
		twitter = json['twitter'];
		description = json['description'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['mission_name'] = missionName;
		data['mission_id'] = missionId;
		data['manufacturers'] = manufacturers;
		data['payload_ids'] = payloadIds;
		data['wikipedia'] = wikipedia;
		data['website'] = website;
		data['twitter'] = twitter;
		data['description'] = description;
		return data;
	}
}