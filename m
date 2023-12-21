Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E749458224
	for <oe-lkp@lists.linux.dev>; Thu, 21 Dec 2023 18:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7c/Ex8F"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-28bc870c540so855472a91.2
        for <oe-lkp@lists.linux.dev>; Thu, 21 Dec 2023 10:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703182042; x=1703786842; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vwxm4MQFnXmGAoqWrhD8p/Elnnju7eM5veCA6QYgeM=;
        b=D7c/Ex8F4V04jDK3lC8AoshHPvpueB6VsZVQ0muIAm5FhvkO3wDVOUBuRU9cEJo3oR
         p0NdpcAwSfs6ZrCf/nYav8DP5NZ4QeMOHv0OsuDEJUWUGOZ5tzsg+R/aaATwVgNKszTG
         xce/gwC+1OehwfRyc8JXClmTmPiaQLFuwIYGvy/9NTEw1G3f2IJPvH7CtUMCEXeClcIy
         r7ZW91X91xxM3PXKfllD8zn10UUjTATbEOEnsnjF9Uf7EHut/HP1UGUX3QtJy8w7NXQ6
         oJ1kRLXGh8kvq4xl+ZKyML7Q4McoHlLrvZl5/ygKNLfxg4cL72d1Xv5knsli/ZUCy/zr
         jyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703182042; x=1703786842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vwxm4MQFnXmGAoqWrhD8p/Elnnju7eM5veCA6QYgeM=;
        b=ZhuHxz0wOwaoyso3P+u+oUmgBjQeHm2jxD69yULGRLYTWACZkzOmiTxmxylP3c5BAq
         GtD3dizVfTz+DKWsrVqHlj/+tYqlKkHgLApTaPj3VgHI5ThqMvi910vz1tLtCGvGhp1Q
         h7kvqM7U/dTSjfJvBWc/1t/QG2d58/XcYXxN314O6bQ9D6O4CrME80aeSi3f1Tin1YO+
         HdQEZMmuHuiKb+0k3XfUiktvsWp4kxZWB7hTHIfU5Tt83BGLIuKs20qc9T2vy5GogEes
         f1Gi782cChiIz2iDKvpimYGXJFdKDZPvfOqJ4GYF5I80S7bNo1r3LvrWXnM1H9YF6tKV
         uZ0Q==
X-Gm-Message-State: AOJu0Yz6JIfQpmKJxuxopFOzkP+zwca0ha3KKCKZ1RriMFQFq9kGYVBq
	rA8b2fnDG5vxUIhqaOcu1HLb4q2275RyGFGUkxI=
X-Google-Smtp-Source: AGHT+IHgFrSJEiJzYZUEnd12x4d9QQsMLaIrDdPk07kby7mfbP3yC87Js/SZ1hHmoSSEOZ+YSyUpUR/gyVK/CHIYHHo=
X-Received: by 2002:a17:90a:ce05:b0:28c:5b6:f95e with SMTP id
 f5-20020a17090ace0500b0028c05b6f95emr21572pju.5.1703182042204; Thu, 21 Dec
 2023 10:07:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202312192310.56367035-oliver.sang@intel.com> <CAHbLzkogaL-VTuZbBbPp=O8TPZxJmabJLRx1hrD-65rtbRmTtQ@mail.gmail.com>
 <ec48d168-284b-4376-97a7-090273a3ae5e@intel.com> <CAHbLzkrAdZ4GrtnH0NUhwPm=gZzkaGT96xVbiyOQaJ3uCFRDnw@mail.gmail.com>
 <CAHbLzkrd-y2=KHS-zreH8FUmQtOaf_FGuyj78zNNH3FbpCQNnA@mail.gmail.com>
 <b1974dc2-0e25-4075-a9ba-5e1face6c0cd@intel.com> <ZYPDwCcAjX+r+g6s@casper.infradead.org>
In-Reply-To: <ZYPDwCcAjX+r+g6s@casper.infradead.org>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 21 Dec 2023 10:07:09 -0800
Message-ID: <CAHbLzkpX29RGTrRwVpK+nh5uWyC9pJnyCjQcjjreEy2N=4QsqA@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 1111d46b5c: stress-ng.pthread.ops_per_sec
 -84.3% regression
To: Matthew Wilcox <willy@infradead.org>
Cc: Yin Fengwei <fengwei.yin@intel.com>, kernel test robot <oliver.sang@intel.com>, 
	Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Christopher Lameter <cl@linux.com>, ying.huang@intel.com, feng.tang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 8:49=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Thu, Dec 21, 2023 at 08:58:42AM +0800, Yin Fengwei wrote:
> > Yes. MAP_STACK is also mentioned in manpage of mmap. I did test to
> > filter out of the MAP_STACK mapping based on this patch. The regression
> > in stress-ng.pthread was gone. I suppose this is kind of safe because
> > the madvise call is only applied to glibc allocated stack.
> >
> >
> > But what I am not sure was whether it's worthy to do such kind of chang=
e
> > as the regression only is seen obviously in micro-benchmark. No evidenc=
e
> > showed the other regressionsin this report is related with madvise. At
> > least from the perf statstics. Need to check more on stream/ramspeed.
>
> FWIW, we had a customer report a significant performance problem when
> inadvertently using 2MB pages for stacks.  They were able to avoid it by
> using 2044KiB sized stacks ...

Thanks for the report. This provided more justification regarding
honoring MAP_STACK on Linux. Some applications, for example, pthread,
just allocate a fixed size area for stack. This confuses kernel
because kernel tell stack by VM_GROWSDOWN | VM_GROWSUP.

But I'm still a little confused by why THP for stack could result in
significant performance problems. Unless the applications resize the
stack quite often.
