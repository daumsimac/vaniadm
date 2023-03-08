package com.vani.transaction.dto;

import com.vani.common.dto.PagingDto;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@EqualsAndHashCode(callSuper=false)
public class TrVhListDto extends PagingDto {
  private String orgC;
  private String svcId;
  private String fromDate;
  private String toDate;
  private String fromTime;
  private String toTime;
  private String debitBnkId;
  private String debitRsrcNum;
  private String crdBnkId;
  private String crdRsrcNum;
  private String cliMsgId;
  private String gblid;
  private String tranAm;
  private String rspC;
  private String tmoOcuYn;
  private String trprcStsc;

  private String url = "/transaction/trHistory/listView";

}
