import 'package:app/common/model/splash_entity_entity.dart';

splashEntityEntityFromJson(SplashEntityEntity data, Map<String, dynamic> json) {
  if (json['code'] != null) {
    data.code = json['code']?.toInt();
  }
  if (json['message'] != null) {
    data.message = json['message']?.toString();
  }
  if (json['result'] != null) {
    data.result = new List<SplashEntityResult>();
    (json['result'] as List).forEach((v) {
      data.result.add(new SplashEntityResult().fromJson(v));
    });
  }
  return data;
}

Map<String, dynamic> splashEntityEntityToJson(SplashEntityEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['code'] = entity.code;
  data['message'] = entity.message;
  if (entity.result != null) {
    data['result'] = entity.result.map((v) => v.toJson()).toList();
  }
  return data;
}

splashEntityResultFromJson(SplashEntityResult data, Map<String, dynamic> json) {
  if (json['country'] != null) {
    data.country = json['country']?.toString();
  }
  if (json['piao_id'] != null) {
    data.piaoId = json['piao_id']?.toString();
  }
  if (json['res_encryption_flag'] != null) {
    data.resEncryptionFlag = json['res_encryption_flag']?.toString();
  }
  if (json['mv_provider'] != null) {
    data.mvProvider = json['mv_provider']?.toString();
  }
  if (json['biaoshi'] != null) {
    data.biaoshi = json['biaoshi']?.toString();
  }
  if (json['artist_name'] != null) {
    data.artistName = json['artist_name']?.toString();
  }
  if (json['is_first_publish'] != null) {
    data.isFirstPublish = json['is_first_publish']?.toInt();
  }
  if (json['language'] != null) {
    data.language = json['language']?.toString();
  }
  if (json['album_1000_1000'] != null) {
    data.album10001000 = json['album_1000_1000']?.toString();
  }
  if (json['korean_bb_song'] != null) {
    data.koreanBbSong = json['korean_bb_song']?.toString();
  }
  if (json['pic_huge'] != null) {
    data.picHuge = json['pic_huge']?.toString();
  }
  if (json['all_rate'] != null) {
    data.allRate = json['all_rate']?.toString();
  }
  if (json['song_source'] != null) {
    data.songSource = json['song_source']?.toString();
  }
  if (json['song_id'] != null) {
    data.songId = json['song_id']?.toString();
  }
  if (json['album_500_500'] != null) {
    data.album500500 = json['album_500_500']?.toString();
  }
  if (json['rank'] != null) {
    data.rank = json['rank']?.toString();
  }
  if (json['pic_premium'] != null) {
    data.picPremium = json['pic_premium']?.toString();
  }
  if (json['album_800_800'] != null) {
    data.album800800 = json['album_800_800']?.toString();
  }
  if (json['info'] != null) {
    data.info = json['info']?.toString();
  }
  if (json['area'] != null) {
    data.area = json['area']?.toString();
  }
  if (json['si_proxycompany'] != null) {
    data.siProxycompany = json['si_proxycompany']?.toString();
  }
  if (json['has_mv_mobile'] != null) {
    data.hasMvMobile = json['has_mv_mobile']?.toInt();
  }
  if (json['is_new'] != null) {
    data.isNew = json['is_new']?.toString();
  }
  if (json['author'] != null) {
    data.author = json['author']?.toString();
  }
  if (json['resource_type'] != null) {
    data.resourceType = json['resource_type']?.toString();
  }
  if (json['has_filmtv'] != null) {
    data.hasFilmtv = json['has_filmtv']?.toString();
  }
  if (json['all_artist_ting_uid'] != null) {
    data.allArtistTingUid = json['all_artist_ting_uid']?.toString();
  }
  if (json['artist_id'] != null) {
    data.artistId = json['artist_id']?.toString();
  }
  if (json['versions'] != null) {
    data.versions = json['versions']?.toString();
  }
  if (json['publishtime'] != null) {
    data.publishtime = json['publishtime']?.toString();
  }
  if (json['style'] != null) {
    data.style = json['style']?.toString();
  }
  if (json['album_id'] != null) {
    data.albumId = json['album_id']?.toString();
  }
  if (json['album_no'] != null) {
    data.albumNo = json['album_no']?.toString();
  }
  if (json['resource_type_ext'] != null) {
    data.resourceTypeExt = json['resource_type_ext']?.toString();
  }
  if (json['del_status'] != null) {
    data.delStatus = json['del_status']?.toString();
  }
  if (json['hot'] != null) {
    data.hot = json['hot']?.toString();
  }
  if (json['toneid'] != null) {
    data.toneid = json['toneid']?.toString();
  }
  if (json['title'] != null) {
    data.title = json['title']?.toString();
  }
  if (json['pic_big'] != null) {
    data.picBig = json['pic_big']?.toString();
  }
  if (json['relate_status'] != null) {
    data.relateStatus = json['relate_status']?.toString();
  }
  if (json['rank_change'] != null) {
    data.rankChange = json['rank_change']?.toString();
  }
  if (json['lrclink'] != null) {
    data.lrclink = json['lrclink']?.toString();
  }
  if (json['file_duration'] != null) {
    data.fileDuration = json['file_duration']?.toInt();
  }
  if (json['havehigh'] != null) {
    data.havehigh = json['havehigh']?.toInt();
  }
  if (json['charge'] != null) {
    data.charge = json['charge']?.toInt();
  }
  if (json['pic_radio'] != null) {
    data.picRadio = json['pic_radio']?.toString();
  }
  if (json['learn'] != null) {
    data.learn = json['learn']?.toInt();
  }
  if (json['pic_s500'] != null) {
    data.picS500 = json['pic_s500']?.toString();
  }
  if (json['all_artist_id'] != null) {
    data.allArtistId = json['all_artist_id']?.toString();
  }
  if (json['pic_small'] != null) {
    data.picSmall = json['pic_small']?.toString();
  }
  if (json['bitrate_fee'] != null) {
    data.bitrateFee = json['bitrate_fee']?.toString();
  }
  if (json['has_mv'] != null) {
    data.hasMv = json['has_mv']?.toInt();
  }
  if (json['copy_type'] != null) {
    data.copyType = json['copy_type']?.toString();
  }
  if (json['ting_uid'] != null) {
    data.tingUid = json['ting_uid']?.toString();
  }
  if (json['album_title'] != null) {
    data.albumTitle = json['album_title']?.toString();
  }
  return data;
}

Map<String, dynamic> splashEntityResultToJson(SplashEntityResult entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['country'] = entity.country;
  data['piao_id'] = entity.piaoId;
  data['res_encryption_flag'] = entity.resEncryptionFlag;
  data['mv_provider'] = entity.mvProvider;
  data['biaoshi'] = entity.biaoshi;
  data['artist_name'] = entity.artistName;
  data['is_first_publish'] = entity.isFirstPublish;
  data['language'] = entity.language;
  data['album_1000_1000'] = entity.album10001000;
  data['korean_bb_song'] = entity.koreanBbSong;
  data['pic_huge'] = entity.picHuge;
  data['all_rate'] = entity.allRate;
  data['song_source'] = entity.songSource;
  data['song_id'] = entity.songId;
  data['album_500_500'] = entity.album500500;
  data['rank'] = entity.rank;
  data['pic_premium'] = entity.picPremium;
  data['album_800_800'] = entity.album800800;
  data['info'] = entity.info;
  data['area'] = entity.area;
  data['si_proxycompany'] = entity.siProxycompany;
  data['has_mv_mobile'] = entity.hasMvMobile;
  data['is_new'] = entity.isNew;
  data['author'] = entity.author;
  data['resource_type'] = entity.resourceType;
  data['has_filmtv'] = entity.hasFilmtv;
  data['all_artist_ting_uid'] = entity.allArtistTingUid;
  data['artist_id'] = entity.artistId;
  data['versions'] = entity.versions;
  data['publishtime'] = entity.publishtime;
  data['style'] = entity.style;
  data['album_id'] = entity.albumId;
  data['album_no'] = entity.albumNo;
  data['resource_type_ext'] = entity.resourceTypeExt;
  data['del_status'] = entity.delStatus;
  data['hot'] = entity.hot;
  data['toneid'] = entity.toneid;
  data['title'] = entity.title;
  data['pic_big'] = entity.picBig;
  data['relate_status'] = entity.relateStatus;
  data['rank_change'] = entity.rankChange;
  data['lrclink'] = entity.lrclink;
  data['file_duration'] = entity.fileDuration;
  data['havehigh'] = entity.havehigh;
  data['charge'] = entity.charge;
  data['pic_radio'] = entity.picRadio;
  data['learn'] = entity.learn;
  data['pic_s500'] = entity.picS500;
  data['all_artist_id'] = entity.allArtistId;
  data['pic_small'] = entity.picSmall;
  data['bitrate_fee'] = entity.bitrateFee;
  data['has_mv'] = entity.hasMv;
  data['copy_type'] = entity.copyType;
  data['ting_uid'] = entity.tingUid;
  data['album_title'] = entity.albumTitle;
  return data;
}
