Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ECC2890D
	for <oe-lkp@lists.linux.dev>; Thu, 24 Aug 2023 14:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692886364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1YeFf3Wlrfc0CcBF8o0TQp1/prpVwhPD/RteH85vGLQ=;
	b=EBmcrXoiy+WxnD4Q1CBzQF3WWqAmmAY2uVonRGwAb0UKSRbSjB+FtfRw8iaQuTtzYl8hZH
	GT6yZa6VXE5COuLMfMuN3QADKf8ERozkkWqPEeyu9a+qv7TCzcxhMZ3XlDwEQxTQAQMvXo
	JaP0yh6XwbCz1RFIzCAmfb8XjtgHY/g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-_hajzuusPoSaJFW35qtFew-1; Thu, 24 Aug 2023 10:12:41 -0400
X-MC-Unique: _hajzuusPoSaJFW35qtFew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2988F823F65;
	Thu, 24 Aug 2023 14:12:37 +0000 (UTC)
Received: from [192.168.37.1] (ovpn-0-2.rdu2.redhat.com [10.22.0.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85C8A140E963;
	Thu, 24 Aug 2023 14:12:35 +0000 (UTC)
From: Benjamin Coddington <bcodding@redhat.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
 lkp@intel.com, linux-kernel@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org,
 ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [linus:master] [NFSD]  39d432fc76:  fsmark.files_per_sec -100.0%
 regression
Date: Thu, 24 Aug 2023 10:12:33 -0400
Message-ID: <D38094B9-CE6F-4BE1-9250-22073A1DD86E@redhat.com>
In-Reply-To: <ZOdZ7DiQ4jqhoj0i@tissot.1015granger.net>
References: <202308241229.68396422-oliver.sang@intel.com>
 <ZOdZ7DiQ4jqhoj0i@tissot.1015granger.net>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

On 24 Aug 2023, at 9:23, Chuck Lever wrote:

> On Thu, Aug 24, 2023 at 01:59:06PM +0800, kernel test robot wrote:
>>
>>
>> hi, Chuck Lever,
>>
>> Fengwei (CCed) helped us review this astonishing finding by fsmark tests,
>> and doubt below part:
>> -			nfsd4_end_grace(nn);
>> +			trace_nfsd_end_grace(netns(file));
>>
>> and confirmed if adding back:
>> 			nfsd4_end_grace(nn);
>>
>> the regression is gone and files_per_sec restore to 61.93.
>
> As always, thanks for the report. However, this result is not
> plausible. "end_grace" happens only once after a server reboot.
>
> Can you confirm that the NFS server kernel is not crashing
> during the test?

Does the removal of nfsd4_end_grace() here disable the ability of nfsdcltrack to
terminate the grace period early on a first start of the server?

Ben

