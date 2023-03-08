package com.vani.transaction.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TrVhListInfo {
  private int no;
  private int totalRowCount;
  private String trDt;
  private String orgC;
  private String orgNm;
  private String rlysysId;
  private String svcId;
  private String cliMsgId;
  private String insTm;
  private String debitBnkId;
  private String gblid;
  private String tranAm;
  private String rspC;
  private String trprcStsc;
  private String rspTm;
  private String crdBnkId;
}
