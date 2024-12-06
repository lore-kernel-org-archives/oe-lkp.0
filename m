Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C64881AD7
	for <oe-lkp@lists.linux.dev>; Fri,  6 Dec 2024 05:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733463572; cv=none; b=pFPTpLRaba1KqW9BdltDqM1DwxEdxv2ipxE+5nEdm6BkqvA+BhhDMMy26hv8C2VZT96Ls+5xyx4yfzuV7F9CUYLVNMEqNg6dNuVcto2HXwNl9Vn+dcBpnBIstIhkgTfSrBSC9pTK4LuXtvqZeLPs9PJCQvXTcms1K4Ce1Z75j4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733463572; c=relaxed/simple;
	bh=yh8QahYVf+iuYpEWfLmJQpp6cLg8k/jJ7I00d8UqlV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=geWSJ55Y4jr+NuSxkb5pyIohAiwqbPnAF8eqVUXDUIThA6/LuYqFLL2FtzVnjkULoeyYPzcvo4/MRZJY6jf5CQJp2ayuzDm9LULmyjBh4Jqm+PbAC9qiPUl/SvGG2S2vfpGEpslfc8B7XtgAFOXYCDdeRBJFw1oCzB+tgIwZavg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWLtO84n; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWLtO84n"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6d8edbd1a3bso877416d6.3
        for <oe-lkp@lists.linux.dev>; Thu, 05 Dec 2024 21:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733463569; x=1734068369; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1UVn7wGFmECPF2lNGZ84JYvzvAH/5Lwkzha/A+P6gc=;
        b=AWLtO84nqwwS+yvzPJTe3sLlrSOOQtIEIOtabm9y+wFPHy2/vamw4Y0T4ZtCXv1JM1
         YX77zqrwfzbfjVear/yfC772iIGNeaVid2d3v4M0uFFBwtmhaJVWzh46jJVd6ug0YuIA
         CnJjZA5/p5WqYWl3nMumfS+ozro9BtTuWYeDaoph4kQC/QahKeWTHLPIq5Aws+9cv7su
         HD9fYx2PKhgMj1flzHEE9TzxSdRrIzY5miW/pCdXz0mbNnK+VpVjflOfT7F7hnj9mHcN
         pQRvLCqdsmw4bVfcq/cb/U8QYndMeR2IPGqe3gSZKw7gi81in1wCW9wbgiIpfXSXSXVP
         c89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733463569; x=1734068369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1UVn7wGFmECPF2lNGZ84JYvzvAH/5Lwkzha/A+P6gc=;
        b=rgEruKa0MefHv5EApB28BQR/SxNRR6z/rWPpyiKK0G2V1bZIqSJBhrjfGyzy3FykV3
         fV5rozy62qxRbOEKjG2hkhhS+ZB5PkQERyhEhco/yalPyuEpvjfBf2o7edYAuX3YiJAQ
         NV1/C5onagxqDtqmqnrCPVt35k2y98i5ej3bw3kcmrMCyrxQB+O9SZZbDd63Ox7TivkC
         wNnOn6uQ+LOjv55kRe1zlFq1sg7yBd9YaFQUjTlC5Tq+3gYTxyEtV8rO8uYu7/fKMmtK
         dViKpeHiwCWt1VWIJBKh0SoxB6Wxzso7eRF4V+5e09srPfBAdusFlVi2AD6Qi4BHCiZT
         WQKw==
X-Gm-Message-State: AOJu0YzqtThcrBKO9x+dOQOQMSMf2wSsojDo8phVOq0x9fe1o9+wZN2X
	NJPiViDgli3454gqzsgzN3yfr5ewKqE5OnFnGyrfwRqsKzJJicVw2amHhsWwjHvLzS/y8HyOMHw
	DjBPZXLei3SwFOoeXArmHFQftBCU=
X-Gm-Gg: ASbGncugLbiHn+joM+io2i1OtMZ8lcD7trloetK55v3n6rk76JQhVyXNsksbEFKcL6p
	EHXvZD0wJMN3oxtAmIa+QyF0Gd9I58S8+yQ==
X-Google-Smtp-Source: AGHT+IEspmmFXD1CBuAp6TP0iqvhJQ+EhlurQHA2WeBZbn3qlyvkG1cL6PVLnrmpXxWRK3cuL+Gp946nsTWoaQP8rSQ=
X-Received: by 2002:a05:6214:4003:b0:6d8:97ea:4362 with SMTP id
 6a1803df08f44-6d8e71fefe5mr24912836d6.38.1733463569030; Thu, 05 Dec 2024
 21:39:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411292300.61edbd37-lkp@intel.com> <CALOAHbABe2DFLWboZ7KF-=d643keJYBx0Es=+aF-J=GxqLXHAA@mail.gmail.com>
 <Z051LzN/qkrHrAMh@xsang-OptiPlex-9020> <CALOAHbDq8yBuCEMsoL=Xr+_QHQ39-=XHK+PEN5KxncxmL=nhYw@mail.gmail.com>
 <Z1Jg+vcpFKGSfx25@xsang-OptiPlex-9020>
In-Reply-To: <Z1Jg+vcpFKGSfx25@xsang-OptiPlex-9020>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 6 Dec 2024 13:38:53 +0800
Message-ID: <CALOAHbCXx_sQqpVMS0Z1B+dkGMHL3vAPBT_1udRRy-0ivy3FKw@mail.gmail.com>
Subject: Re: [linux-next:master] [mm/readahead] 13da30d6f9: BUG:soft_lockup-CPU##stuck_for#s![usemem:#]
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 10:27=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Yafang,
>
> On Tue, Dec 03, 2024 at 05:33:16PM +0800, Yafang Shao wrote:
> > On Tue, Dec 3, 2024 at 11:04=E2=80=AFAM Oliver Sang <oliver.sang@intel.=
com> wrote:
> > >
> > > hi, Yafang,
> > >
> > > On Tue, Dec 03, 2024 at 10:14:50AM +0800, Yafang Shao wrote:
> > > > On Fri, Nov 29, 2024 at 11:19=E2=80=AFPM kernel test robot
> > > > <oliver.sang@intel.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > Hello,
> > > > >
> > > > > kernel test robot noticed "BUG:soft_lockup-CPU##stuck_for#s![usem=
em:#]" on:
> > > > >
> > > > > commit: 13da30d6f9150dff876f94a3f32d555e484ad04f ("mm/readahead: =
fix large folio support in async readahead")
> > > > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git =
master
> > > > >
> > > > > [test failed on linux-next/master cfba9f07a1d6aeca38f47f1f472cfb0=
ba133d341]
> > > > >
> > > > > in testcase: vm-scalability
> > > > > version: vm-scalability-x86_64-6f4ef16-0_20241103
> > > > > with following parameters:
> > > > >
> > > > >         runtime: 300s
> > > > >         test: mmap-xread-seq-mt
> > > > >         cpufreq_governor: performance
> > > > >
> > > > >
> > > > >
> > > > > config: x86_64-rhel-9.4
> > > > > compiler: gcc-12
> > > > > test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 838=
0H CPU @ 2.90GHz (Cooper Lake) with 192G memory
> > > > >
> > > > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > > > >
> > > > >
> > > > >
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a =
new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-lkp/202411292300.61edbd37-lk=
p@intel.com
> > > > >
> > > > >
> > >
> > > [...]
> > >
> > > >
> > > > Is this issue consistently reproducible?
> > > > I attempted to reproduce it using the mmap-xread-seq-mt test case b=
ut
> > > > was unsuccessful.
> > >
> > > in our tests, the issue is quite persistent. as below, 100% reproduce=
d in all
> > > 8 runs, keeps clean on parent.
> > >
> > > d1aa0c04294e2988 13da30d6f9150dff876f94a3f32
> > > ---------------- ---------------------------
> > >        fail:runs  %reproduction    fail:runs
> > >            |             |             |
> > >            :8          100%           8:8     dmesg.BUG:soft_lockup-C=
PU##stuck_for#s![usemem:#]
> > >            :8          100%           8:8     dmesg.Kernel_panic-not_=
syncing:softlockup:hung_tasks
> > >
> > > to avoid any env issue, we rebuild kernel and rerun more to check. if=
 still
> > > consistently reproduced, we will follow your further requests. thanks
> >
> > Although I=E2=80=99ve made extensive attempts, I haven=E2=80=99t been a=
ble to
> > reproduce the issue. My best guess is that, in the non-MADV_HUGEPAGE
> > case, ra->size might be increasing to an unexpectedly large value. If
> > that=E2=80=99s the case, I believe the issue can be resolved with the
> > following additional change:
> >
> > diff --git a/mm/readahead.c b/mm/readahead.c
> > index 9b8a48e736c6..e30132bc2593 100644
> > --- a/mm/readahead.c
> > +++ b/mm/readahead.c
> > @@ -385,8 +385,6 @@ static unsigned long get_next_ra_size(struct
> > file_ra_state *ra,
> >                 return 4 * cur;
> >         if (cur <=3D max / 2)
> >                 return 2 * cur;
> > -       if (cur > max)
> > -               return cur;
> >         return max;
> >  }
> >
> > @@ -644,7 +642,11 @@ void page_cache_async_ra(struct readahead_control =
*ractl,
> >                         1UL << order);
> >         if (index =3D=3D expected) {
> >                 ra->start +=3D ra->size;
> > -               ra->size =3D get_next_ra_size(ra, max_pages);
> > +               /*
> > +                * For the MADV_HUGEPAGE case, the ra->size might be la=
rger than
> > +                * the max_pages.
> > +                */
> > +               ra->size =3D max(ra->size, get_next_ra_size(ra, max_pag=
es));
> >                 ra->async_size =3D ra->size;
> >                 goto readit;
> >         }
> >
> > Could you please test this if you can consistently reproduce the bug?
>
> by this patch, we confirmed the issue gone on both platforms.
>
> Tested-by: kernel test robot <oliver.sang@intel.com>

Great! Thanks for your work. I'll send a new version.


--
Regards
Yafang
