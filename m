Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012F41442F4
	for <oe-lkp@lists.linux.dev>; Tue,  3 Dec 2024 09:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218435; cv=none; b=k4UBe5EFmN/ZABd3JIf/Dxo1iea4j5qjOE9WzMdVRdkdKO3cKev9A/Y1B7S6WfNUgWG3tjS1FRnu3gewX6t/zkBYHr8oZNNXrcgp3G5Dt1YznqJq455AKUf+Jr80P2WrXX/rvu+M5Ox2y5xNhBg6Yi6Du9n1B6NAbkKk2+a2UpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218435; c=relaxed/simple;
	bh=z89TXH8M3RnRiRnDUwQNKuorvlS6MdyYOpZ+avQ1d9o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDedN1Fuha3fq1FUqPjIgU9siOqRfIiqRZL17yn0lNEg1qtt5u4pWRn4V2RI993+XWzJrAhW/UH1aURqwP9KotD4XJgeTcmAxcHcUCBbCarwijKDRT2jQIlrZ7YxW246OcWuYdDR9/rCyqb/y8g1PMIrA7Vh45vigjz7yzpba60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAFrFXSN; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAFrFXSN"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b678da9310so424145585a.2
        for <oe-lkp@lists.linux.dev>; Tue, 03 Dec 2024 01:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733218433; x=1733823233; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkLwuq1H6f4LHZCNvaOoqQcCTucWtCr3bsTBx+UFyno=;
        b=FAFrFXSNNuRMYcKzEkFbkkDPVWAlG7tBOOjML5JCcXg4HcDpc8NkkXvt7HyKawNH/K
         FIx12p45S/NAkCTZDoZDFD6uTMflrum+/tRclrRd8MaKClF0t/321INImd9/WMgvnGWV
         lTALl2fnhU0Liln199s56ZXq2G7GsXwcJzMAMYHbJVHRCUKSc2m0H7eF6tDec4w1xWFO
         qcxLq+1MG28O8uEAGQyrlu+uvgqqzjXdibKkwZfhRNCg6I2QnoL2XTnPsxZLx2wSMVpm
         3EQTDPd6mn9EdKw7dNFspQuU7SuwzQnkz6YtDMkrQR+nLRDH2AHPNl/ixi0Qv47qLDJv
         Rtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733218433; x=1733823233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkLwuq1H6f4LHZCNvaOoqQcCTucWtCr3bsTBx+UFyno=;
        b=P/S6yI+Y032jHTlAfM4bawjNXcGRYaa2R/gEtd59lmoN30vQZek5FCeDO5AzHWEh1D
         WJYInmdjdJZl/8dKRBT4ExDfQCkx5NVHrFxmurN7b/cXtRh4lnpVNmG63kP9xpgWwMpa
         kJuWDQ8lzGdRqezU/Mfb9MCP7h+Qo3UjtlOlKIlCHISKzp5mT9C5T6j5CxSqzacLCjSf
         p3vjUonZc68zkmnc/eWTzVOSZRCo3AoCH7odPMnrOErRvjAWPHIUzR6VODkV3+SXHw0q
         0gfU2kZs+M4+n+UAEDiHTEqCCfNKuXJtFv5lOOplUMoMAaeeiWWSvefa5sGJjNBdmW2g
         sDCw==
X-Gm-Message-State: AOJu0Yyk0EKh5sRkSHfOAIcC1XdJ5ggDqCy/Jg2ZAZcCyOi88ss6/oVJ
	h/OT8Xr79keOyHLmP+El75NxyhUs1DUNJRUosoxg2CDTj1XO7tnQzz1ItFvgIoxEOhRFwPMB3/p
	k85Nw7RhjwMzXUyLXIhH/fIRe+Jg=
X-Gm-Gg: ASbGncsvkMHb55cvjzT4koScvjti29bmAPsENhZxaZHlf3XfOQJtdBW4gbvgXfJyBz4
	iUSD5c1lcNt9S7k2C8yCg57PSGwTJ9SSpZA==
X-Google-Smtp-Source: AGHT+IGRyv8mvf87qtMrjPEFuUPdE5+8CekbfuoSDg1qq43Qtk1kZov9g6zctBvS3SJ85K6yQ16Hz0IL9gfKEC3/HZk=
X-Received: by 2002:a05:6214:2a8c:b0:6d8:a188:369a with SMTP id
 6a1803df08f44-6d8b748dfc9mr19415106d6.48.1733218432859; Tue, 03 Dec 2024
 01:33:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411292300.61edbd37-lkp@intel.com> <CALOAHbABe2DFLWboZ7KF-=d643keJYBx0Es=+aF-J=GxqLXHAA@mail.gmail.com>
 <Z051LzN/qkrHrAMh@xsang-OptiPlex-9020>
In-Reply-To: <Z051LzN/qkrHrAMh@xsang-OptiPlex-9020>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 3 Dec 2024 17:33:16 +0800
Message-ID: <CALOAHbDq8yBuCEMsoL=Xr+_QHQ39-=XHK+PEN5KxncxmL=nhYw@mail.gmail.com>
Subject: Re: [linux-next:master] [mm/readahead] 13da30d6f9: BUG:soft_lockup-CPU##stuck_for#s![usemem:#]
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:04=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Yafang,
>
> On Tue, Dec 03, 2024 at 10:14:50AM +0800, Yafang Shao wrote:
> > On Fri, Nov 29, 2024 at 11:19=E2=80=AFPM kernel test robot
> > <oliver.sang@intel.com> wrote:
> > >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed "BUG:soft_lockup-CPU##stuck_for#s![usemem:#=
]" on:
> > >
> > > commit: 13da30d6f9150dff876f94a3f32d555e484ad04f ("mm/readahead: fix =
large folio support in async readahead")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mast=
er
> > >
> > > [test failed on linux-next/master cfba9f07a1d6aeca38f47f1f472cfb0ba13=
3d341]
> > >
> > > in testcase: vm-scalability
> > > version: vm-scalability-x86_64-6f4ef16-0_20241103
> > > with following parameters:
> > >
> > >         runtime: 300s
> > >         test: mmap-xread-seq-mt
> > >         cpufreq_governor: performance
> > >
> > >
> > >
> > > config: x86_64-rhel-9.4
> > > compiler: gcc-12
> > > test machine: 224 threads 4 sockets Intel(R) Xeon(R) Platinum 8380H C=
PU @ 2.90GHz (Cooper Lake) with 192G memory
> > >
> > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > >
> > >
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202411292300.61edbd37-lkp@in=
tel.com
> > >
> > >
>
> [...]
>
> >
> > Is this issue consistently reproducible?
> > I attempted to reproduce it using the mmap-xread-seq-mt test case but
> > was unsuccessful.
>
> in our tests, the issue is quite persistent. as below, 100% reproduced in=
 all
> 8 runs, keeps clean on parent.
>
> d1aa0c04294e2988 13da30d6f9150dff876f94a3f32
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :8          100%           8:8     dmesg.BUG:soft_lockup-CPU##=
stuck_for#s![usemem:#]
>            :8          100%           8:8     dmesg.Kernel_panic-not_sync=
ing:softlockup:hung_tasks
>
> to avoid any env issue, we rebuild kernel and rerun more to check. if sti=
ll
> consistently reproduced, we will follow your further requests. thanks

Although I=E2=80=99ve made extensive attempts, I haven=E2=80=99t been able =
to
reproduce the issue. My best guess is that, in the non-MADV_HUGEPAGE
case, ra->size might be increasing to an unexpectedly large value. If
that=E2=80=99s the case, I believe the issue can be resolved with the
following additional change:

diff --git a/mm/readahead.c b/mm/readahead.c
index 9b8a48e736c6..e30132bc2593 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -385,8 +385,6 @@ static unsigned long get_next_ra_size(struct
file_ra_state *ra,
                return 4 * cur;
        if (cur <=3D max / 2)
                return 2 * cur;
-       if (cur > max)
-               return cur;
        return max;
 }

@@ -644,7 +642,11 @@ void page_cache_async_ra(struct readahead_control *rac=
tl,
                        1UL << order);
        if (index =3D=3D expected) {
                ra->start +=3D ra->size;
-               ra->size =3D get_next_ra_size(ra, max_pages);
+               /*
+                * For the MADV_HUGEPAGE case, the ra->size might be larger=
 than
+                * the max_pages.
+                */
+               ra->size =3D max(ra->size, get_next_ra_size(ra, max_pages))=
;
                ra->async_size =3D ra->size;
                goto readit;
        }

Could you please test this if you can consistently reproduce the bug?

--
Regards
Yafang
