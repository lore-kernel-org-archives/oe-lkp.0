Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832C733ADB9
	for <oe-lkp@lists.linux.dev>; Thu, 18 Dec 2025 10:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766052739; cv=none; b=Jq8N1xjH5Zk4jqbpM6ywUqVxOQfjufmtvnvtbhAdabYXv2SplSqNiZrKOkH74+lEweKrjmweXU1oUPL192XNXN90j1IbX6NfQMLabRN87EYJTXvVsDu24MFOhFvDQGGe7CpppPVYbt+nA6PVgW1BZR7ZkaQKK1bD3o1OcuF34pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766052739; c=relaxed/simple;
	bh=9IYjtWog7D6hgsSDD/DpsT4Xk20yyiHchirjb4LjnUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/oHBG8QBtXrmMzthYZI79ZOvFrzFjI//Jdzl5txbPC28satRsLiz8poWQWn0XhoYfnKiVFvUM+zQku2J0vxseQXydUrRL10j9sszGFuUw9YrlZae5Y3xbifYsb53G5zwDoQZghr+TP5xymyda3MjfjO6Erc73DXejTboRG/C4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=NmcmOo2b; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="NmcmOo2b"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BI8ll1n012517;
	Thu, 18 Dec 2025 10:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kRBoh8
	1M1DnTVj/C83HKQcKjeqz37y/zcew5E6QmDcw=; b=NmcmOo2bY/R6zvvYg9GUXb
	WcqsyqwTweSOSATTeB7hUZDQslrvbawvdJ43q9XN4Rn8K54YtPmpu+CwSSGULQeZ
	cacYkC2qwPSsUf7oX6Gwf72FnpsciYmvddckCM9F7eZV5dMrU0M49fE3kMoA5REV
	RyryGq5IogsSkPodvbbFVx9zO5/H4BzQae6YseGGD7HN3f1FcTZmVLM5kgLoeme5
	kXopIQrPftP+DhxVQV/bvsgXQSa3dr8PF+yf4lvCU6uHaNF6kDcUQhu0jEvNDLSJ
	o9zZ6/hykmSNcEP2ZYR7HZPy3vArPSlSOR1y/sJW6GtmkSEW3HQ94RFIREKP74Og
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yn8t2nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 10:12:02 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BI6p9Xh002945;
	Thu, 18 Dec 2025 10:12:01 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kykyjmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 10:12:01 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BIABx5C44630390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 10:11:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A04920076;
	Thu, 18 Dec 2025 10:11:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44E1A20077;
	Thu, 18 Dec 2025 10:11:56 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Dec 2025 10:11:56 +0000 (GMT)
Message-ID: <6f0954ba-2ca7-41e8-b4f7-b0b17990f659@linux.ibm.com>
Date: Thu, 18 Dec 2025 15:41:55 +0530
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tip:sched/core] [sched/fair] 089d84203a:
 pts.schbench.32.usec,_99.9th_latency_percentile 52.4% regression
To: Peter Zijlstra <peterz@infradead.org>,
        kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org,
        x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Juri Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        aubrey.li@linux.intel.com, yu.c.chen@intel.com
References: <202512181208.753b9f6e-lkp@intel.com>
 <20251218083747.GI3707891@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20251218083747.GI3707891@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAxOCBTYWx0ZWRfXwQLzewxi9rpD
 2rUYkDiZRQNw+zZWA8ADeLVhX297KuJWJKPuOe9nK/16ksZuCOTTpsRrpSOmK5PwhMKAgnxGGjr
 gdANyuylNDZ/+MGbQqnc4wMAk5XUKv6NZcka/Xx/HVSoZeT4DwTQhxHoZUSr1OjHDDEaEoADw77
 n5maQ16jDSyKvrbgbhuLEWkFviZhWno5V6Wutgvom8RA1eVjDeL2dD3eS3m7RuHqhpk5InCyIQn
 cbFT8jklMRWGCOuUJjyM9SJLKe9tZdQE/pAfr6RanTvx1+7SRZhyIDXEeN9tw7SafaENfHOM6+S
 RmXJ0v+tub+gsMx1JwbEV2E7ek8xthvnWmdO0yVXC8F9NXImifUfd11noPp4NPFGov8mRhGP1Jv
 qUDgMaid6jxUf4R0RfhCTik7NLlz/g==
X-Proofpoint-GUID: Aat6kv_jpeoMQ27UkXs-QR_Iev-WEn-S
X-Proofpoint-ORIG-GUID: Aat6kv_jpeoMQ27UkXs-QR_Iev-WEn-S
X-Authority-Analysis: v=2.4 cv=LbYxKzfi c=1 sm=1 tr=0 ts=6943d372 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=AAfG2KVKSz7IoxDedYMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1011 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2512130018



On 12/18/25 2:07 PM, Peter Zijlstra wrote:
> On Thu, Dec 18, 2025 at 12:59:53PM +0800, kernel test robot wrote:
>>
>>
>> Hello,
>>
>> kernel test robot noticed a 52.4% regression of pts.schbench.32.usec,_99.9th_latency_percentile on:
>>
>>
>> commit: 089d84203ad42bc8fd6dbf41683e162ac6e848cd ("sched/fair: Fold the sched_avg update")
>> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core
> 
> Well, that obviously wasn't the intention. Let me pull that patch :/

Is it possible because it missed scaling by se_weight(se) ??


+#define __update_sa(sa, name, delta_avg, delta_sum) do {       \
+       add_positive(&(sa)->name##_avg, delta_avg);             \
+       add_positive(&(sa)->name##_sum, delta_sum);             \
+       (sa)->name##_sum = max_t(typeof((sa)->name##_sum),      \
+                              (sa)->name##_sum,                \
+                              (sa)->name##_avg * PELT_MIN_DIVIDER); \
+} while (0)
+
  static inline void
  enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
  {
-       cfs_rq->avg.load_avg += se->avg.load_avg;
-       cfs_rq->avg.load_sum += se_weight(se) * se->avg.load_sum;
+       __update_sa(&cfs_rq->avg, load, se->avg.load_avg, se->avg.load_sum);
  }
  
