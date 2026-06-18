Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275B72EEE80
	for <oe-lkp@lists.linux.dev>; Thu, 18 Jun 2026 16:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798640; cv=pass; b=S4IjraBSM+lHWE/xMyU/wZyLKL9vCvmDL/FHfDFLDKpwuDpcvfb4x/WU9jtLMHRcvs7sIaoSMGvl2KFXlMZsCwy+jr9LKdeozgA7unB1htLno5RdNizvm9rxWgg8wh/AR0zrpKFbIT5oBhlL/tHJmu8rYF1p8lcL96GUqxzbONc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798640; c=relaxed/simple;
	bh=JxajIuFFPzIDIlNu/ZZSYfy3SGLhW6O+Tar5hg7rAW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Twq68EGqFrWVHYZJIeV/wgsUeeuFNJXnWBSC/a+/TqfM+bSMRQkQzwpHCRQzb/e58DN/dgvxAsGHSsnCpXV7yjoYn4IAXuk5U70bFSxenKtux92j6e34/iXBv54FXzD0hB5Ar0EDtjF7E2wZb/RvTxYN5FqbXmIOwkG8S+6FPZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iPXDvPwl; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iPXDvPwl"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-69565156c06so14197a12.0
        for <oe-lkp@lists.linux.dev>; Thu, 18 Jun 2026 09:03:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781798637; cv=none;
        d=google.com; s=arc-20260327;
        b=LcejjB+ITt/qAeyNuKiaB6YNVtRDpb04YYmmBru1AzNhQ9MtSeRmd8RF2BFfD+DRcG
         BpyhPXG6H8XWOkR+ncJ0T17SkWveZIKoi0kCU10bZt0I8lRrd2/zJEYGbvBrWyFVG5n3
         0dlnp1v75YxhO5L523jAXCgymL4geNuqY0WVX+KU+mkMkQCREfmMT8fNjG12zKIZeppT
         dB01UL25l65iuejI7nLpjXaHGQB1OImBXRQcCdvkEKD+QpWpMEhhdxXSeFOJNGlIpNFk
         5a4L2pcHbgDvIMvwT0gb+9zVI6DM2D7DAEEtyPPB9B9GglxHMP3TP3gte8AiceCkAJGt
         YjdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JxajIuFFPzIDIlNu/ZZSYfy3SGLhW6O+Tar5hg7rAW0=;
        fh=bqJ4/AFcnbnwqKoY8uRJJfVCeqbZAZbp/3AEZpEJX1A=;
        b=kPHkgRCIZxNuU8/4TUhdrLgzr9bL0mRJAMnaqozdDVt396aXXpPW/xlh4iUUiJwz/D
         WWzideUqUYoXQ6zSa016xNDlQbbT/Kus7QyuGLP0dgaIDyzeUBG7fyU68jkGV4W3x47A
         lpHQy0iSO2JFBovoaPIVBSkOBZZJhazy9lNiKKNwdsSV3uVW6Z5ONh3llDRNlYpgUEIr
         Svm52OzqsSQaaJ2l7LvKidXVB1TvXCIKOmNddYaS3RWvR8LMolva5wUfVhvHecqDkjCa
         I8xkpXfq5aL//dR04bUm5ho1/yII+gT+jrKGSfExWCqHBB1gx6kQObbB6zwlClvGdmnK
         1uJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781798637; x=1782403437; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JxajIuFFPzIDIlNu/ZZSYfy3SGLhW6O+Tar5hg7rAW0=;
        b=iPXDvPwlUCwpA7QbSi0BfstCdcVPFyxGsTT/f/3n3eDmkzhIUXa1ySjGCcqOPugro2
         ApldAtIZraoYCcts8GnOk7B1Y9ALtgBbuJZpRr5958WdboRABbgvrJUk5o18Xeih4k/s
         HQ6aEZlre+52p3fZb5OzsnZITww6U0vhPVsgfU0eZvrPH5cs5jCSaGFKZC10Jowgs2U+
         j1BtKuR5DqgaurmDm6a4EhwB2pU9X60xvZ2+3Du4qIkOu/JQ+2KsOQZYvHTMfYQy4Vxk
         6uK9kK3mwkxKzRoxCK8dNAKMQij9gUM0BebURkzhNYdVOtQhaj/T6s+4j97cV60HbTpx
         s6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798637; x=1782403437;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JxajIuFFPzIDIlNu/ZZSYfy3SGLhW6O+Tar5hg7rAW0=;
        b=UEQfQLRuIAPg0XRMO3gpRtHyVVw2jj3pvFTDCwlMvaatvjnr26c3GdrZc3CNXMxEVg
         ESv2/6h8KBy4a9La+ga3PUgoB2uw24bhZR5sh0oGoTlpb16AG/EnaWFB/tXWhvfWBBNo
         2jVNhbPG5OZ+x9Tm5WBO08ibLeDzvTrGDUmDYgnyYuKLJBIkPr9SKJgR+EKFdytQT/sk
         0AQedmvd4nhZ1mzuyKunIT2vYtc3K62fQC+2Svzxj2oZtbMTEMU5cndiG+DWZl2gV4H0
         y+sSJ6ylxeEt2fzymkhjA8yrBXE+WHJX4XGcEc/Gj5yUta7/v2MFypguVPDt8uytAzHH
         DKeg==
X-Forwarded-Encrypted: i=1; AFNElJ8ywIbUCoBwUgvO7UtVudYyqGH9dYdUqii8QXHQtGUqlTyZI6La9r/go/GIm8UjzgEsPUEfQVo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOOK0NLC7sHFC2CV145DVW/8m1skdanIHVG/fAxt9auJuLcTA7
	ziyg1Fsbr3AlA+GgcQo3CNpZeDaZZs4aiaWei2u3gvEyURP11VqCR+h8Rxh1z8oGaxgZYfW9ZZs
	N5wY/F62IoGe+ki8p0f0ba24pwFCCXwiS7VnMAc71
X-Gm-Gg: AfdE7clmwxOEjQXZSpcQHjwFAc8JH2j4VR+JNrIfjLSZHCjEya6IdzKMlPtzJkrrGrh
	ZBDykg9VvL5GiMbOD0+TF2IE6oSscxgRjn3jAvhlMPT+FRppGmwJShJrfTeOzf2NfKI3h7e24nK
	leUx9UooUShzKcG287W/RAdxOY6bN1ISnsVRHM6ijRpBvxM6ZySmEV61l9i1t9tvIf186kiZ2fn
	71v67cMtZrV/qeomH5Tzot2dSPw2awKxIQy2KOEb1M2GIjb1aOTqE+Jj+E3s4gES+88R2C9h+aB
	0v7HW9BY91PIMUwf1QBM33Pd
X-Received: by 2002:a05:6402:a506:10b0:693:17e4:c6b0 with SMTP id
 4fb4d7f45d1cf-695d04870aamr34694a12.9.1781798636936; Thu, 18 Jun 2026
 09:03:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606181547.617a6967-lkp@intel.com> <6z2rqmo7b6m2rdhqurspwya25ps4dj7lctdygnmq3rn4xt6h3i@57kiiy72epgd>
 <ajP_-zqVPtbzvc9j@lucifer>
In-Reply-To: <ajP_-zqVPtbzvc9j@lucifer>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 18 Jun 2026 16:03:43 +0000
X-Gm-Features: AVVi8CfU26Kn6wJARZ7W52yMNTl8DSKc66QrvdqWWlF5NJUNYk-ssIW_WadDCkU
Message-ID: <CAJuCfpFed0GuMk+dE-Xn0w45Mn1Spds-pc2BE__FUoWm6+R7_w@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] 7b32f64bc5: pts.svt-av1.Preset13.Bosphorus4K.frames_per_second
 45.8% regression
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Jan Kara <jack@suse.cz>, kernel test robot <oliver.sang@intel.com>, 
	Frederick Mayle <fmayle@google.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Andrew Morton <akpm@linux-foundation.org>, Kalesh Singh <kaleshsingh@google.com>, 
	David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 2:30=E2=80=AFPM Lorenzo Stoakes <ljs@kernel.org> wr=
ote:
>
> On Thu, Jun 18, 2026 at 11:30:47AM +0200, Jan Kara wrote:
> > On Thu 18-06-26 16:00:42, kernel test robot wrote:
> > > Hello,
> > >
> > > kernel test robot noticed a 45.8% regression of pts.svt-av1.Preset13.=
Bosphorus4K.frames_per_second on:
> >
> > This one looks serious enough and real. It would be good to figure out =
what
> > happens in this benchmark that it benefits from the readahead across VM=
A
> > boundaries so much...
>
> I think a revert first no? This seems pretty huge for something that isn'=
t key
> to the kernel, then a new attempt can be tried with this issue addressed
> perhaps?

A quick search yields: "The
pts.svt-av1.Preset13.Bosphorus4K.frames_per_second is a benchmarking
metric from the Phoronix Test Suite that measures how many frames per
second a CPU can encode using the open-source SVT-AV1 video encoder."

If this is a video encoding benchmark I would expect it to explicitly
prefetch the data from the disk before measuring the encoding speed.
If limiting readahead caused this regression, I suspect the benchmark
doesn't explicitly prefetch the data...

>
> I seem to recall objecting to this in the past, had a look around and saw=
 [0]
> which has some discussion I think specifically on the VMA boundaries thin=
g.
>
> [0]:https://lore.kernel.org/linux-mm/CAC_TJvfG8GcwG_2w1o6GOTZS8tfEx2h9A91=
qsenYfYsX8Te=3DBg@mail.gmail.com/
>
> (Sorry to be naggy buuut :) - I see there wasn't maintainer [Matthew] sig=
noff on
> this, we should really be in the habit of _requiring_ that for merge).
>
> Thanks, Lorenzo
