Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989A712FF97
	for <oe-lkp@lists.linux.dev>; Tue,  6 Feb 2024 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707231911; cv=none; b=EyJnXI1zr9ViXI3muovjj1YnZp4LEQqmD2lNByjntJNcnpkl5yjVr807ocl63HsCZ2nBbsJ4mLepkDxHsxLtSgPWEt5s4T5kQD9J4svbGfUP0O7RLooIiWlWrZHYBKJRyqt/7UoyvhOPQZD6mSPhqqh21dn7ncrLRGitp544VUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707231911; c=relaxed/simple;
	bh=bVno8WQTGbHurQQwnhVu0vijufkiMDbLKRAxnxjC3Js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6zEdRMjonywfN5rANeDA1tCl99Y+qaweNkTsQLxIxXx+W5YAGkrTNAF11GbQkUz4EKXGmuHvZyTXgDRO4c276+ly0Q/g6UvDU7GN1ksMnoMxk0YBylFI8vLB4rtve+81GbMr++ml/I9IsR9qrpf8V3Ouxr9u4D544GuKsSSS/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwgccOeF; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwgccOeF"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-21959190723so1733045fac.1
        for <oe-lkp@lists.linux.dev>; Tue, 06 Feb 2024 07:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707231908; x=1707836708; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioIvR4LsMaW6xA6i7+EQnV42R5bTHmknBpHkYqe7Uv8=;
        b=dwgccOeFfd7mecI+SWzA2CcUSYfU99SMOiwHegSUekMUxNU3wucfRbpaee/8W/0RTr
         nXvRnEgj64VBJ1rKQz1lmCCJOoewTASJhtGFCy5iTULMKf2KsAonpBRXQp5wNyd/pBKy
         MOs2i+cQJ6qI2YV89ugYpzeVyWE9jATNl+LoxT+h1vgNnoV8Ax66tUZAyRpHKz8RKv6W
         c2WrgoENKQl5HJ/xjgdFlR8evlQxunxuBOy6o8ac/F4xxSoAppquMQ6W7bsuWCCC06VR
         fVDJ4Jyum/Wq5LsNNLX7t4BuVKdrVn3rD+H3Xezybnh+VtM27EEPmwGJuXH9XO7YJRoF
         lyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707231908; x=1707836708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioIvR4LsMaW6xA6i7+EQnV42R5bTHmknBpHkYqe7Uv8=;
        b=P7KE+d+U6lxqDWHZ1ahpnALp95W4/x2iQB7zD0hidkpdqPcVPZCV9PeniaxTe1fsN7
         EuBbJ6UHWQA8k2sEzEFH9FDtgVa0DChmm4kXrfqOsYLbhcG7MUN7GznpKGgutyvU2jav
         FtK7DyNXCqo/3mTaCGCxDu3dgiTCtKW+f5akPuxMfOwlLzp6cTsoebMwqB7xXOwFYeGO
         mXPLrq48J86km7cifornwSJLGNQwQpJ7YliNPKHuWWN/C/1v3+uN5qeNX1+S70h9LHLk
         b4hwo+3fNKZ4V0+vMt4KRr8lf13S5hQR5cybNuheEZamd67St3WfQo8RzVWeGL3Wh/5s
         Ojig==
X-Gm-Message-State: AOJu0Yy5+sXl+jhJbqTrOaw9R5Uaj/GI4W6AXU5v8MQ6kALU/4rQx3hc
	mMbQBZdmxDEh4irP0HmGDOau4iVaCn0WTbH5YHwna6hfpR85xXqaA/XwJFSJN80P+y0Wd8QrbxI
	6F9Tbnr+EkpydJJHF+qbp8fx+8Ng=
X-Google-Smtp-Source: AGHT+IFWVTl6mm2CDlJsEbStomZ4IAGwkcu/Joc866MJc31wLxOcsv3DEJmL9yHTk+0ChG99yqhy1/iteBtcWJn+H6M=
X-Received: by 2002:a05:6870:5251:b0:204:f0b:3bfd with SMTP id
 o17-20020a056870525100b002040f0b3bfdmr3094700oai.43.1707231908476; Tue, 06
 Feb 2024 07:05:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401312229.eddeb9a6-oliver.sang@intel.com> <CAOQ4uxiwCGxBBbz3Edsu-aeJbNzh5b-+gvTHwtBFnCvbto2v-g@mail.gmail.com>
 <CAOQ4uxgAaApTVxxPLKH69PMP-5My=1vS_c6TGqvV5MizMKoaiw@mail.gmail.com> <Zb8vk1Psust0ODrs@xsang-OptiPlex-9020>
In-Reply-To: <Zb8vk1Psust0ODrs@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 6 Feb 2024 17:04:56 +0200
Message-ID: <CAOQ4uxjFA=P8ZiPjaqP-4Ka35GdqEtKaTTG1XMnts6rOswchCA@mail.gmail.com>
Subject: Re: [linus:master] [remap_range] dfad37051a: stress-ng.file-ioctl.ops_per_sec
 -11.2% regression
To: Oliver Sang <oliver.sang@intel.com>, Christian Brauner <brauner@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, ying.huang@intel.com, feng.tang@intel.com, 
	fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 4, 2024 at 8:33=E2=80=AFAM Oliver Sang <oliver.sang@intel.com> =
wrote:
>
> hi, Amir,
>
> On Fri, Feb 02, 2024 at 11:13:56AM +0200, Amir Goldstein wrote:
> > On Wed, Jan 31, 2024 at 5:47=E2=80=AFPM Amir Goldstein <amir73il@gmail.=
com> wrote:
> > >
> > > On Wed, Jan 31, 2024 at 4:13=E2=80=AFPM kenel test robot <oliver.sang=
@intel.com> wrote:
> > > >
> > > >
> > > >
> > > > Hello,
> > > >
> > > > kernel test robot noticed a -11.2% regression of stress-ng.file-ioc=
tl.ops_per_sec on:
> > > >
> > > >
> > > > commit: dfad37051ade6ac0d404ef4913f3bd01954ee51c ("remap_range: mov=
e permission hooks out of do_clone_file_range()")
> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git mas=
ter
> > > >
> > >
> > > Can you please try this fix:
> > >
> > >  7d4213664bda remap_range: move sanity checks out of do_clone_file_ra=
nge()
> > >
> > > from:
> > >
> > > https://github.com/amir73il/linux ovl-fixes
> > >
> >
> > Sorry, Oliver, this was a buggy commit.
> > I pushed this fixes version to ovl-fixes branch:
> >
> >  1c5e7db8e1b2 remap_range: merge do_clone_file_range() into
> > vfs_clone_file_range()
> >
> > Can you please test.
>
> the regression disappeared by above commit in our tests.
>
> I noticed this branch is based on v6.8-rc2, so I directly tested upon it =
and its
> parent (3f01e53bf6). I found 3f01e53bf6 has same data as dfad37051a we re=
ported.
>
> and on 1c5e7db8e1b2, the performance back to the same level before dfad37=
051a.
>

Thanks for testing!

Christian, can you please amend the fix commit to
Reported-and-tested-by: kernel test robot <oliver.sang@intel.com>

Thanks,
Amir.
