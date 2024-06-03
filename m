Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74069487BF
	for <oe-lkp@lists.linux.dev>; Mon,  3 Jun 2024 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717402415; cv=none; b=AM54SStin/KKkSMR4v7ZOhOevHQU9eQcDC+lL55yuUdXodMtiTi+unG0pyogX13S9U3pIoiWEnpPE5zJNz2Yg1ASi8efETdu7izhEKoT6h1NjyglMyRZuA3auZn/IHdd8n+/Rcx5foYefGaxc+owStJlYeev9KYQkIzB9ad2wUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717402415; c=relaxed/simple;
	bh=X+QZ5tIXNMkrZz42xWHJmtinS+U5RobDDqWtjlhroU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTb7JdHkPRHMvt4cSsQglm34Tj8hMYB1PQh1CC5fexM8CCIzisRbStTl6CjgTTJlezPeI3u6SAkNB48chWzGNJf1GqJPDgkF0V1VSKFjlPsdHoPe3l11d/qyB0IHdvw7kTVdf5H7DkLZK6Pb9Ikr2B+ZCZrA+OB9Aaio4+bqqfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJiTv9vj; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJiTv9vj"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-792b8d989e8so261889285a.0
        for <oe-lkp@lists.linux.dev>; Mon, 03 Jun 2024 01:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717402413; x=1718007213; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+QZ5tIXNMkrZz42xWHJmtinS+U5RobDDqWtjlhroU0=;
        b=HJiTv9vj0ezHtnmGZkqfoWn0UO6zdyTR4UtqSq5KR66Y4z6rzkZXXv1u+ka0N+I4XP
         Yy+eX6PAohOvUUeV+/ww01A5l4eh9bBb1AYsYENm1h2qNGIurpfxu1cFxY3siZenYzFS
         jBouEPoErperuMAD7EtH7TGdzc3FPTYCFO76kiK7QKUBbaCvZOxexe46LcZVZbI+qBk4
         nFAzSmOqOQfQRxzjIWWDsJ5dmpSwIutEJ3eA37r8S+E9tji227sajuASC9W9OgjFrvtb
         60D2Zim4kkFgPqqfIvNAemtbS4MhllQSIAbqcf9L6cxM97JZEiKhLPGlSFabWQRGXt3W
         v92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717402413; x=1718007213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+QZ5tIXNMkrZz42xWHJmtinS+U5RobDDqWtjlhroU0=;
        b=RK9W/z08pughOD4v5lpdXZ8gxsq8Zp7CRiabWd32fmW26UoJp8WSyOdpcnrSIY5Gdt
         FdSukwfY5Slc3rYqu6UwdZW7bXvlbPWgSkz4009pJ4/JGnmEfz+R2I8bQGp6cJgaXInG
         XZKEfmfA67n+R/DtafzFI49z1fvLCtdhHts8dXzBlQ6ZVwxsIb8QRulI5xrd/ieVCVT8
         P/wu6agFEK4iB3vpzBwJzstg/4YgV1TRnn66qCiHAPdngkMnfWd0gCfSAahEXj2984Qv
         e3uiejLruevo14G4FOx2av9BPmUh/LJxAfaHOsN7bkp2P5zgq/bHYQK7uBYSkTCvC0sA
         1eLg==
X-Forwarded-Encrypted: i=1; AJvYcCVhiCjHu9ej6lSzb01mxIsf7KwOBFxkjNmsWIR/BTd2/d+B3o4SXMbyqzJ7WwsCtsQrFCJ2kZCjNAUIL8qv5Nu/MPO+DpOS
X-Gm-Message-State: AOJu0YyiBAvItRR98+xiHdliZKLbP8ZvhIyEIWMzxbANKqc9wI7wmNzN
	f4WCN11n2FtdCsx3r1OMGuxY8RqMDuCr4L3k6U4oHurFaEZ7KJg5C4lBgqdW2XtQUavLxlv+U4W
	c56rHou5cey4Rq0ERb7p0gOU3LB4=
X-Google-Smtp-Source: AGHT+IGHcDLf8Qxsoy8QfhtrkiFH+riFgbMEW/3Rkwi65e8sUrWxWb8XULcPYOFATjxF0+DiNzyGndfJ8el9+9OAZDg=
X-Received: by 2002:a05:620a:47dd:b0:792:8d34:a9ba with SMTP id
 af79cd13be357-794f4fd4b04mr1336044785a.24.1717402413152; Mon, 03 Jun 2024
 01:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405231056.66ecbb94-oliver.sang@intel.com> <CAOQ4uxjGE0cwmacsxSjAkh3otYB0_XRbC1b5i_1iS=iLeEyXqg@mail.gmail.com>
 <Zl13SEVfjj9orpW/@xsang-OptiPlex-9020>
In-Reply-To: <Zl13SEVfjj9orpW/@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 3 Jun 2024 11:13:21 +0300
Message-ID: <CAOQ4uxif7Nf2+BvUC9ZViZPY2xZTWYNgF3AqAt-73=FO=Y+hLw@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [fs] 8829cb6189: stress-ng.fault.ops_per_sec
 -2.3% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-lkp@lists.linux.dev, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 10:57=E2=80=AFAM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Amir,
>
> On Thu, May 30, 2024 at 04:27:57PM +0300, Amir Goldstein wrote:
> > On Thu, May 23, 2024 at 5:59=E2=80=AFAM kernel test robot <oliver.sang@=
intel.com> wrote:
> > >
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed a -2.3% regression of stress-ng.fault.ops_p=
er_sec on:
>
> [...]
>
> > I am scratching my head to figure out why these functions are affected =
by
> > the regressing commit, which as far as I can see only adds
> > if (READ_ONCE(sb->s_write_srcu)) test in write helpers,
> > which should always be false.
> >
> > The only thing I can think of is that s_write_srcu on the same cache li=
ne as
> > s_inode_*_lock, which impacts performance of acquiring those spinlocks,
> > but this explanation seems far-fetched.
> >
> > Anyway, I tried moving sb->s_write_srcu next to s_fsnotify_info and oth=
er
> > read-mostly sb members to see if it makes any difference.
> > Also rebased branch on v6.10-rc1:
> >
> > * 1d15ffdc12d2 - (sb_write_barrier) fanotify: introduce FAN_MARK_SYNC f=
lag
> > * 5029c0cbd085 - fanotify: activate sb write barriers for pre-modify
> > event watchers
> > * fda0270c803d - fs: hold s_write_srcu for pre-modify permission
> > events on aio write
> > * e34d0ca5cdfd - fs: hold s_write_srcu for pre-modify permission events=
 on write
> > * afdd0701bfb7 - fs: add srcu variants for mnt_{want,drop}_write() help=
ers
> > * 61d0f429d8bf - fs: implement 'vfs write barriers'
> >
> > Oliver,
> >
> > Can you please re-test?
>
> I compare the tip 1d15ffdc12d2 with v6.10-rc1, found there is no peforman=
ce
> difference now. (if you need full comparison, please let me know). Thanks=
!
>

Excellent, thanks you!

Amir.
