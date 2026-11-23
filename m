Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414631;
	b=uo54ayIeGlfXZTW/LqlsXapQslmjNfOqvqPgd3oMAXN/I07J1MjPrCp9MLt4lMQw0U2H
	 KTpVeVv1K712lzwdt0EeTfCCFciivxiOE3ZqHyULdyqQrgQc23G/3O7q02YeP31pCuU7e
	 qQThZXUDvKPEW7VJcTyDAoJlg8pR1A1OQvDm6CKA6KPJFg4/SVi2qU23/BJvRUL1crzU5
	 mD+lE20S5OganFyh4v0o1D8UXvSSH2tEmcox5SHfUEoqbizaTKyWcjv3Vgc2ph1+rRY3G
	 GnQeWO0bogZQvTkCtbDp3VLSrhAPaxtjIt1gQH2+KnZV31JF7E07W6jqzLdc8Yi26/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414631;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rmfLa4vZ70fQMy+4OlNodmBRiMPp9h2L5WiU2LNv7CE=;
	b=ApYXmQmD51jIxNsNGAF9tHQDNOpHQs9ffIZHVI5KyXb6QGQw7Xcq1TU6+Y4KJiA7aZ36
	 4QPsxjS9hg+PeuA/KLtmN+nb93fjxJnRxKg57pyArh1+PeE61tM1iOg45cGu6Jx1QzohC
	 lp9eGbdAXgFeSTGc9fYgLAjZBqDhn8Bfs0cUHYNYfsAXxAdhq630S5W1M8+xWg5cPJtlT
	 oe/nFV2WU6P+28xoHcupoYOdt07WHkyUM+JQP9rxFsgisc+YNQWORpZ0gm435AA3RtuV2
	 BT5sIWWEpIgUB/uvmNUkFL9WXjPPEc8XzJPPkqhxDwqlf7FP8ncoTfC9XqlZ67pBUDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n9rkuixj;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43410606A31E
	for <oe-lkp@lists.linux.dev>; Mon, 23 Nov 2026 06:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43410606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n9rkuixj
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN54q5r1364727;
	Mon, 23 Nov 2026 06:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rmfLa4
	vZ70fQMy+4OlNodmBRiMPp9h2L5WiU2LNv7CE=; b=n9rkuixjDPVraOv3mbq3P3
	Dsb4wpn9mG2GBlQOSBCyZaqg7GiFxeLvSTsdZFpr4pSYfMbk4P65WY1b4cskGG+3
	xcuc5LvnGyeBviSEnrhV1fkbcaGm6x297GWJu9Vmd+sGiXp5zBpBfJw0gcsXNNK1
	yyUYpsjRxEjDDpJf5hu2Kc0RETjfxplF9xENMMXQ0euTlAoBxYSmoUdkJDHRuziP
	K2jXXr6sG8aoe1EBVkaHSreDvjqsAL0IwDhbMaIkLxnFrZG6UtEvPyEjOf7ygS/1
	EL4gqI6AQLGXZG8LKk6aFirMOcAiN90cK2HynqkqIB9Da/Fk3nE432lbx+SjATLg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34p49dng-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 06:16:57 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN54fZ7264691;
	Mon, 23 Nov 2026 06:16:56 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j3qufncwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 06:16:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AN6Gs2K51511666
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 06:16:54 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E6A420043;
	Mon, 23 Nov 2026 06:16:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B06F2004B;
	Mon, 23 Nov 2026 06:16:52 +0000 (GMT)
Received: from [9.124.208.21] (unknown [9.124.208.21])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Nov 2026 06:16:52 +0000 (GMT)
Message-ID: <ad8f4ed1-2b06-4bbf-8c4c-96043071bcf3@linux.ibm.com>
Date: Mon, 23 Nov 2026 11:46:51 +0530
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linus:master] [virt/steal_governor] 1fb28c664a:
 WARNING:at_kernel/sched/core.c:#set_task_cpu
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Yury Norov <yury.norov@gmail.com>, Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>
References: <202611230353.1fedceba-lkp@intel.com>
 <7446f558-5cbe-4efc-b6bb-686d0dca9f42@linux.ibm.com>
 <awPT3mE4ShWUTw7H@ly-workstation>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <awPT3mE4ShWUTw7H@ly-workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX7HQIqlz9fc0v
 zq+5KGadhcRhp27rC3GT07ky7YHoGWV07RXimrZJA0R2Uw6+6cKulDP3qtzUfzBc9sPKVe/Hgp7
 ja/3FXXDGTeibu+GKgYBU/eo+fNK+LE=
X-Proofpoint-GUID: rtad1lhCOiAkGxFIayfCklYzbBUhHw8R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX9usp7dzG+p38
 pIAtqfBoHIUq3E/aYFIU96e5ZvKM5I3qkc5eyrcF1zbTsBZbovjbvNOUoMB9Ov6a2EPLe5D8ZQG
 Jfez620GQ9yjgZ96JRKak/qRuYwy9YAiQ6hkBGz948/CKofl+jkFDU733idEjNmBm8vVL3FN5/6
 02G35CrYR5kSVf3/JW6sdzDtA2I92aYWGtwih/Yu39b9hTMtlvLeqqmrVrB9owufA0aROgfsTyf
 o6v0sy1SMMr6y1MsR+4gkW6ZG2MCnM+mhYDLT7SlUVaVX5Jw0PkkLgiyFHVnSm/JJ0a6LE6iwAW
 U003Rz9l/AvBTjnNQA5qaG0+hQhs+0nAI2A32Zuccuy4ah2Aw7WkPuKAUt6GLjsnkDKyzIzCMZf
 X7hOUObJRsz0mCB2YWxKTVADhxXYL8jJJJg7Onv+qviOkMjKKXlsM1WhXc13rMo6qFuzIyGOicI
 GbJ+CnSEy+qngvXKCUA==
X-Proofpoint-ORIG-GUID: quDhZ_ErSNfQPsIWqsJBM6KyyT0dfqxO
X-Authority-Analysis: v=2.4 cv=QabzLcbv c=1 sm=1 tr=0 ts=6b03da59 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=QED9Jkl4QGb8jGKjosIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230024


>>>
>>> --
>>> 0-DAY CI Kernel Test Service
>>> https://github.com/intel/lkp-tests/wiki
>>>
>>>
>>
>>
>> Could you please try with below patch included?
>> Symptoms seems to be similar.
>>
>> https://lore.kernel.org/all/179538776083.92412.4311246927428883759.tip-bot2@tip-bot2/
> 
> With this patch applied, issue cannot be reproduced.
> 

Thanks for confirming. With the patch in sched/urgent already, all is well!!
