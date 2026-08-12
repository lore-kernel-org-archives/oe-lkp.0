Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0FD437847
	for <oe-lkp@lists.linux.dev>; Wed, 12 Aug 2026 11:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535422; cv=none; b=YDVtJvkJPFcL+SBF2fTitwf7I9WusLPCuG5Whi93zoWvzOLN7p4ehELKwDt451guGEtpSxjqjH4FblRSadCA02FO7+0PwmlSkRt0RSY8jVUCBiURgBo3wU8otFdul/6BOfP7xg9v6WBk1rVJQh5enjKZn9dRz+jjQHVn9pGzPM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535422; c=relaxed/simple;
	bh=MQeqvdsEMU+c7EKkum3JQ+c9gu3ZjF1TV4fkoWpGrx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bmIzrYdxdqEeEYFznOR00LCakZ2hQI85ume+B66JKqDScDq5OEEfLHMTxNLUgxWFfA96Rw4gcBbG09Kv6ePrkuPLGyyR3G7YtzeSEF6kKFuKDqJlyqXLR9E39wJ1gj4uv5jpJ4s74DaG7nAf+j5GEJT7xBC9iMgSi3hyE/T8B+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CfIUV4Ib; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CfIUV4Ib"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB3iGi2205442;
	Wed, 12 Aug 2026 11:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qfRmWv
	u0tVeS6/pLrCHDx2e+b36Cf5WvuQHTyeHszRw=; b=CfIUV4IbZW/isv+EzyNFzf
	Y7qd3LzqwtB944SSVa30AHP2EHxLn5bCLyf5suge3lAtoZJ3mfBhfjpMcIyOO8l3
	5pvm1dl1mE9qqocmKQhbqUhr6Znpil9jRVizsuEC60bTpw7m9axnuAQqVcK5Ph/B
	8rRbssw/iKFd9cJcrQXxDA879LhiO66dQBMZUpgKeXfM7rg1k1YgT1LPIJJ1n8xD
	BGem2fp3NLbzUQFyoDFcfUpIDkef+D5CjxjAgZ4Kj7MC9LmZj+bXKSSlUnW1O3Cg
	2VgeMvpZzEUx0SmW1u+z7S4UDG5xn1iMXU78561WDbg4SVwGI50MIf/PIZXj/3kw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fyb23tsfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 11:50:03 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67CBns4t018709;
	Wed, 12 Aug 2026 11:50:02 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fxh0gdp2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 11:50:02 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67CBo1tj28115612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2026 11:50:01 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D04E658056;
	Wed, 12 Aug 2026 11:50:01 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27B8258052;
	Wed, 12 Aug 2026 11:49:58 +0000 (GMT)
Received: from [9.61.0.237] (unknown [9.61.0.237])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Aug 2026 11:49:57 +0000 (GMT)
Message-ID: <7c68c535-8ae0-4a93-a5ee-5012edcf529b@linux.ibm.com>
Date: Wed, 12 Aug 2026 17:19:56 +0530
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: kernel test robot <yi1.lai@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-nvme@lists.infradead.org,
        linux-kernel@vger.kernel.org, kbusch@kernel.org, hch@lst.de,
        hare@suse.de, sagi@grimberg.me, chaitanyak@nvidia.com,
        gjoyce@linux.ibm.com
References: <20260727151652.3660476-1-nilay@linux.ibm.com>
 <20260727151652.3660476-3-nilay@linux.ibm.com>
 <202608111002.8c383e35-lkp@intel.com>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <202608111002.8c383e35-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=XqfK/1F9 c=1 sm=1 tr=0 ts=6a7c5deb cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=QyXUC8HyAAAA:8 a=sxdaxH8PD2DPu5lfcSEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA5MyBTYWx0ZWRfX7SNnmwvsKgg/
 LfTzfxkUR2W3QceCZh4iuH+nbLH/BjSbLErl/0h7vIfACzn+wzVQh4pm7RKbgPTomJjX11x3EcS
 By7ch+G6sW8OeIAHgn45skYYwXSr4yGgtUdc21+YnWc3dtHvMcczX5BMWDazkOH5/c7ZFckISzO
 Kbfu7txXi2C09JlnfCkQDsi2T4wRkmz3XQ7Rav/v10OQVnvh7NB5guH8AX2vJXZQTVVxdlwZc87
 Aab6aGb7p0/CtUiltdoBWD0cusP6fSqT36G+T83B2AiArXowqL0/t/dlrc2FD8SIwidY+jJ/9Y/
 9Qr2MycPGD+gIxhUGYWLyFTSlEwkH0ORPzFctASsFzrqKhNEXhh18vRk9/LcecqVuYJHVM6u4yk
 nKrhMTa9QjFkJ94LhhYvbq8ic9kHQesbxT37n0VOprDgCYJs6tRG0u/0/KbtuqeIfDLv+gRfqn8
 U8pUGp0K9KBICqLyqVw==
X-Proofpoint-ORIG-GUID: 4guXMY6qjv7scyglCU4CpduYkFdVvXHU
X-Proofpoint-GUID: 4guXMY6qjv7scyglCU4CpduYkFdVvXHU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA5MyBTYWx0ZWRfX2yCtrBf3ZwLb
 UD4eI/F/44gcJG6gvYirg+d5w4TA+jm7YSBkjhBfDuAWtAaGYbGb5l0h9/iz+uLDFyksZU4Wk+q
 kc0UjYXTmAnFeWo4epoUk3HPX/O6kPM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120093

On 8/11/26 2:06 PM, kernel test robot wrote:
> 
> Hello,
> 
> kernel test robot noticed "blktests.nvme/048.fail" on:
> 
> commit: 657b4cd151e042afc228615869b2a6876b91b8fc ("[PATCH v2 2/4] nvme-tcp: limit I/O queue count based on NIC queue count")
> url: https://github.com/intel-lab-lkp/linux/commits/Nilay-Shroff/net-add-helper-for-device-lookup-by-destination-address/20260731-154725
> patch link: https://lore.kernel.org/all/20260727151652.3660476-3-nilay@linux.ibm.com/
> patch subject: [PATCH v2 2/4] nvme-tcp: limit I/O queue count based on NIC queue count
> 
> in testcase: blktests
> version: blktests-x86_64-72a6349-1_20260804
> with following parameters:
> 
> 	disk: 1SSD
> 	test: nvme-group-02
> 	nvme_trtype: tcp
> 
> 
> 
> config: x86_64-rhel-9.4-func
> compiler: gcc-14
> test machine: 16 threads Intel(R) Core(TM) i7-13620H (Raptor Lake) with 32G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <yi1.lai@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-lkp/202608111002.8c383e35-lkp@intel.com
> 
> 
> nvme/048 (tr=tcp) (Test queue count changes on reconnect)
>      runtime  4.358s  ...
> nvme/048 (tr=tcp) (Test queue count changes on reconnect)    [failed]
>      runtime  4.358s  ...  7.340s
>      --- tests/nvme/048.out	2026-08-04 23:49:51.000000000 +0000
>      +++ /mnt/nvme-group-02/nodev_tr_tcp/nvme/048.out.bad	2026-08-06 06:04:55.281322408 +0000
>      @@ -1,2 +1,4 @@
>       Running nvme/048
>      +expected queue count 3 not set
>      +FAIL
>       Test complete
> 
Thanks for the report!

This requires changes in blktests nvme/048. So once this change/commit
is merged upstream, I'd send another patch to update the test.

On another note, you may want to check your automation script which sends
auto-email. I see the email subject line is empty.

Thanks,
--Nilay
