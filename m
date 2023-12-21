Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474C3634F1
	for <oe-lkp@lists.linux.dev>; Thu, 21 Dec 2023 18:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOHhTCRX"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5cddc5455aeso545421a12.1
        for <oe-lkp@lists.linux.dev>; Thu, 21 Dec 2023 10:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703182306; x=1703787106; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtDW/QlkRmZR7Q6yp8kPCUc87VHLEMLBcKw7Zj/2psY=;
        b=eOHhTCRXMpm6k4mkto3d6NlRjJ41+qnKclMlKFublXLfOsx3QDIwMF3tbBckn4dIzT
         6OL0uFhqVz0uQ1K9gJRy8AwBLAPP9d4K9mJ6DpZWoHyJ99XDqidBojDtJsGM1pBObLiQ
         oTIF1OwmSEuzxOHxvx6zuFymFwR4b6PicAdWcQ+gr2Z/s5RjTO6s0Pb1GqSJi7sENM+a
         fmf/5FXvpSMAat+Dn0g0FIVFUHgTG/zQytRBQQlsWGVgvlmmjj+luJOkON+H5UHLfwiP
         QZ9eD+c9ySidiUJv01wQmVBGLOiCcFZ5iaewyoe9mW9HW3LAWDXroscN7J45F9xoOnZQ
         c4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703182306; x=1703787106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtDW/QlkRmZR7Q6yp8kPCUc87VHLEMLBcKw7Zj/2psY=;
        b=gRBVJDnVP5Iu2w6iqAxz3v6JeFq+nCVb3TJdYeSPOnGb4KEh7H1qv0M9mBAwBa+4C3
         DibX/ojPuAuiMCiADtgzUVn7/bTZ0zkE2oVbE8jT32HE81F8mT7FCBLicaT8FViswG3T
         43pLakznehAb6KkqM9G/u5lNU4sEa5/4+PP7uimsuDMVJ/g115Vj2D0/MKpAmH9PRGeY
         zYtdXeNJV8i+sDVMG//8m+p934a8DwWIz4YjOo6Z+YbnNqOL+2TbT+aybr02pQqYVbpV
         z8Lv7Xl/lh+AfzY/aYB5+9XyYyvoucejI/eBrO08EKwe6UG5NDX/M9nz3/nomdqu3v4+
         vczw==
X-Gm-Message-State: AOJu0YxtfxmPWCe9DoI+F+D6sW7hb+5DP5ihEUg8SJisCF4UFw7GG3nY
	cJQaybYl+dzHfWU1tw+YmLVrP88oaftr8zh+tB0=
X-Google-Smtp-Source: AGHT+IGBsZnK+kq+Pp3Jae9ZTy1bMSpfvs2ar5Sfdzl9Dsr5tp9Y302bbpsYWY8W5uNQbN9GEc4HZzGj0Q4O1gbVayY=
X-Received: by 2002:a17:90a:6c06:b0:28b:eb30:edf2 with SMTP id
 x6-20020a17090a6c0600b0028beb30edf2mr128379pjj.81.1703182306513; Thu, 21 Dec
 2023 10:11:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312192310.56367035-oliver.sang@intel.com> <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
 <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com> <CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
 <CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
 <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com> <5753c5cb-62e3-42e6-bf04-b12b4c77b259@intel.com>
In-Reply-To: <5753c5cb-62e3-42e6-bf04-b12b4c77b259@intel.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 21 Dec 2023 10:11:34 -0800
Message-ID: <CAHbLzkqXaGE2RosYSejCU7wTs+p3+SWp25qqWUs8pcSbRp_dHg@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 1111d46b5c: stress-ng.pthread.ops_per_sec
 -84.3% regression
To: "Yin, Fengwei" <fengwei.yin@intel.com>
Cc: kernel test robot <oliver.sang@intel.com>, Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Christopher Lameter <cl@linux.com>, ying.huang@intel.com, feng.tang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 21, 2023 at 5:40=E2=80=AFAM Yin, Fengwei <fengwei.yin@intel.com=
> wrote:
>
>
>
> On 12/21/2023 8:58 AM, Yin Fengwei wrote:
> > But what I am not sure was whether it's worthy to do such kind of chang=
e
> > as the regression only is seen obviously in micro-benchmark. No evidenc=
e
> > showed the other regressionsin this report is related with madvise. At
> > least from the perf statstics. Need to check more on stream/ramspeed.
> > Thanks.
>
> With debugging patch (filter out the stack mapping from THP aligned),
> the result of stream can be restored to around 2%:
>
> commit:
>    30749e6fbb3d391a7939ac347e9612afe8c26e94
>    1111d46b5cbad57486e7a3fab75888accac2f072
>    89f60532d82b9ecd39303a74589f76e4758f176f  -> 1111d46b5cbad with
> debugging patch
>
> 30749e6fbb3d391a 1111d46b5cbad57486e7a3fab75 89f60532d82b9ecd39303a74589
> ---------------- --------------------------- ---------------------------
>      350993           -15.6%     296081 =C2=B1  2%      -1.5%     345689
>    stream.add_bandwidth_MBps
>      349830           -16.1%     293492 =C2=B1  2%      -2.3%     341860 =
=C2=B1
> 2%  stream.add_bandwidth_MBps_harmonicMean
>      333973           -20.5%     265439 =C2=B1  3%      -1.7%     328403
>    stream.copy_bandwidth_MBps
>      332930           -21.7%     260548 =C2=B1  3%      -2.5%     324711 =
=C2=B1
> 2%  stream.copy_bandwidth_MBps_harmonicMean
>      302788           -16.2%     253817 =C2=B1  2%      -1.4%     298421
>    stream.scale_bandwidth_MBps
>      302157           -17.1%     250577 =C2=B1  2%      -2.0%     296054
>    stream.scale_bandwidth_MBps_harmonicMean
>      339047           -12.1%     298061            -1.4%     334206
>    stream.triad_bandwidth_MBps
>      338186           -12.4%     296218            -2.0%     331469
>    stream.triad_bandwidth_MBps_harmonicMean
>
>
> The regression of ramspeed is still there.

Thanks for the debugging patch and the test. If no one has objection
to honor MAP_STACK, I'm going to come up with a more formal patch.
Even though thp_get_unmapped_area() is not called for MAP_STACK, stack
area still may be allocated at 2M aligned address theoretically. And
it may be worse with multi-sized THP, for 1M.

Do you have any instructions regarding how to run ramspeed? Anyway I
may not have time debug it until after holidays.

>
>
> Regards
> Yin, Fengwei
