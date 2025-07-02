Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847F12853F9
	for <oe-lkp@lists.linux.dev>; Wed,  2 Jul 2025 14:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464810; cv=none; b=f+Sk86GRacI2WWDG/0IQh41YzdZ7vjSKyfkTS1HkXGFGtTf2L1JShGSPKJx6AV2p+hGj1LVgyEBbJqG19XbLNxruO3yyn0aLP2UhNdUjA3vpNHNHCRsLWKesvNsgW3dTxTDqZktYas8TgmKr9NMMDbdmTEsEmzYYsMPU3URI+1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464810; c=relaxed/simple;
	bh=Igg8LPA5rkVqnmQilm0fZ+YJ4MwpCHKJU6VZiksU+40=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qwPyKtByU0+gN4I80ntFDGVzzxBo/n5slgzF7NgP1MvlAFthH/WSlJuv7+rWRKWcqQBGqCpdPFhhzPW0pq6HzR8PM0QsHYrZ2vsoTNWlZdqpUNKqcjKup36lb8XO9uWInllJc8jDsJjB8gaXehHNWRO+U7JYOGA37x5xLiapZn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=huLyp8Os; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="huLyp8Os"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751464807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Igg8LPA5rkVqnmQilm0fZ+YJ4MwpCHKJU6VZiksU+40=;
	b=huLyp8OsRGOkI9cZAZkUkJRP4YckHRldP2jJXvP1lz6vn1rCdvZH9MyH6KLM7KhMskCR35
	ZxjBZLS1hKdRveBa9phdPHGa7yH9wKF8/3qSaNgL3CLr2m9R8V9M5dvk4l4GC2swmqmqI5
	2J0mjJiw6dRSq6oS1AND9a+3Ggtj6pI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-RHa9Mc6eOjSQld4QD_IIxw-1; Wed, 02 Jul 2025 10:00:06 -0400
X-MC-Unique: RHa9Mc6eOjSQld4QD_IIxw-1
X-Mimecast-MFC-AGG-ID: RHa9Mc6eOjSQld4QD_IIxw_1751464805
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so2757423f8f.0
        for <oe-lkp@lists.linux.dev>; Wed, 02 Jul 2025 07:00:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751464805; x=1752069605;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Igg8LPA5rkVqnmQilm0fZ+YJ4MwpCHKJU6VZiksU+40=;
        b=Z4NbSMsA5WZHH248HM15HlHRr1Jj4bNXYXv+ryHbEQsl5yMuMVCsvH67rgml5cxWRK
         vomiSpycdr8/ziKx7eKJTDV16+hXvjnc27xLK01xzDGlircGeIKQYG3J84zQ2dqjcGuz
         eO5REpoioX6DuDIXcPveoTvD4KJZGrp52SE5erq84Tv4UrzHgfyvWx+0vzlzdgZNQ/Wh
         MpIL4B+PVN0WKK+Lg0CTmZ0l/IIefr8M6bIKhFS8/IBhpiB0FXeGDxTBViZmEX7yT8gP
         +N88d75Lmp2qD9NRGp+enUla/qDCt5ySFV1SxKSaY/bTiBPJ2835L3BBkzh30yST2a21
         wcCg==
X-Gm-Message-State: AOJu0Yy1RqYRin890c9YHUh9+tlsT7ZM04ruHTHX2LAQMumakr7SyecE
	kX1ozkl/WAp15YijdbkkqbAQzcwbGnnimMWTZcFMtEQeAagp0ZcC7LbvdZTsnEZeE7ekaEEMpGx
	opCcJS7ubLadAob4g5wKVpdtNxUjC1fzfci8bUxCu+QLJmFPIx0Co3k5Gux6GTt1bkfr95oE=
X-Gm-Gg: ASbGncvqqYH1aeTjh0Abj7tUY7Tn8UXhlfdKAzi5iFk5H101nmDQkb0JRcct1fGTGTM
	tdE9sBcEp0iRjnushDISYdzZGSWT25fz48wMVOylSc2v/NqEk/si3ac8glpTC2ComNbes17jIW2
	vrthtL502c4PmVWHR8RbRADH0K+YJvCftnvyrfpmh60jVlaw8ZYBtpBSwku/2U21ptipJr2NfLl
	1yX1V0tCtbvQmaWdKqlJWo1ljT7d6lMfDO0tesBDAa6NSzeqVeJUJ+WOjS5sKURlFvU6IW5bZ9L
	9Ai+rbR/+e+QhlxIem25uFhvuGxFEkuhOwShkoRuvnXQux+z
X-Received: by 2002:a05:6000:4a19:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3b1fdf01e8dmr2476849f8f.9.1751464804823;
        Wed, 02 Jul 2025 07:00:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhh3DXObw3vabrEO3JD4zSKfF5cOAA5+r3CQaJpyAnxxVMI5Xc1L04ZBUtO7UGZIGJ9rTm7A==
X-Received: by 2002:a05:6000:4a19:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3b1fdf01e8dmr2476807f8f.9.1751464804209;
        Wed, 02 Jul 2025 07:00:04 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453b8f298c6sm25087955e9.1.2025.07.02.07.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:00:03 -0700 (PDT)
Message-ID: <de5654b277f424d56ac00b4b9d336491bafff110.camel@redhat.com>
Subject: Re: [RESEND PATCH v13 2/3] sched: Move task_mm_cid_work to mm
 work_struct
From: Gabriele Monaco <gmonaco@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kernel test robot
	 <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, aubrey.li@linux.intel.com,
 yu.c.chen@intel.com,  Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@redhat.com>, Ingo Molnar <mingo@redhat.com>,  Peter
 Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Ingo Molnar <mingo@redhat.org>
Date: Wed, 02 Jul 2025 15:58:28 +0200
In-Reply-To: <26df8965-a430-4be3-a523-d292905f32fa@efficios.com>
References: <202506251555.de6720f7-lkp@intel.com>
	 <26df8965-a430-4be3-a523-d292905f32fa@efficios.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tb2jlwgSAOwaRnDklH9i4FPmQbFDAapvzS4UrK1ZVlo_1751464805
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



On Wed, 2025-06-25 at 09:57 -0400, Mathieu Desnoyers wrote:
> On 2025-06-25 04:01, kernel test robot wrote:
> >=20
> > Hello,
> >=20
> > kernel test robot noticed a 10.1% regression of
> > hackbench.throughput on:
>=20
> Hi Gabriele,
>=20
> This is a significant regression. Can you investigate before it gets
> merged ?
>=20

Hi Mathieu,

I run some tests, the culprit for this performance regression seems to
be the interference due to more consistent `mm_cid` scans and them
running in `work_struct`, which brings some more scheduling overhead.

One solution could be to reduce the frequency: now they run
(sporadically) about every 100ms, if the minimum delay is 1s, the test
results seem ok.

However, I tried another approach that seems promising: work_struct get
scheduled relatively fast and this ends up giving a lot of contention
with kworkers, however something like timer_list seems less aggressive
and we obtain a similar reliability with respect to calls to the mm_cid
scan, without the same performance impact.

At the moment I just kept roughly the same structure of the patch and
used a timer delayed by 1 jiffy in place of the work_struct.
It may look cleaner if we use the timer directly for the 100ms delay
instead of storing and checking the time, in fact running a scan about
100ms after every rseq_handle_notify_resume.

What do you think?

Thanks,
Gabriele

