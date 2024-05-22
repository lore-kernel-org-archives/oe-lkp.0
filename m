Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E853716D
	for <oe-lkp@lists.linux.dev>; Wed, 22 May 2024 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716401536; cv=none; b=p6X27fUD+/SIVYhq+nUaPKeMeRQAIGJQYNrXaJ/4FrlLqeaDD8G2gy4oWLl6jZVhly+nmOnsEnz42seToAsZeKzLq/8++Z4IjiHz5hWvGVMzwfhQzcg/a1ExAwGd/F7FDhnJzqORsW/cN2A8J/Rmk2qaXsnfblxExNWONA5U/c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716401536; c=relaxed/simple;
	bh=ayimWCKkgfYo+0x6XeVSOVgCcBa5dhPMekRUmdgIThw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=less80FqskwangWwAQ2E9cvvNSh3fTMXM/Ac8KBL8smJSweY7LjPEiccDBtLP8Ay4n4k3kA64Wft36QoJ1KRVp/BYunwF8fESDroVMhOhJBpBm9TaFKi1c3gNfEFB6Qu6y/Jd5rFa+YIuvc+eExa0o2Ynnr5flbxbV+nd76a/Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BfG56D6p; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BfG56D6p"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51f0b6b682fso7455244e87.1
        for <oe-lkp@lists.linux.dev>; Wed, 22 May 2024 11:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1716401532; x=1717006332; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AugUKhaYwKDJ/9b03MK/LG9RwwxS/6pxd40CuSzPjmc=;
        b=BfG56D6pzoiqF5NSaBQRWW42bxdaTiMIFTA+hw1GxsIaXy7FOaOp5HK6lfTEXBmQ6p
         F7Xfy9M9kv7S1AoPBYuna1HJBCf+gxEHP3gOSEL3TU9Ajp7xinGjb26AOgr2MIeBP6PG
         kZUsJ9wn9qbHuu8c7nrLDTJAIRoLsx8xJSNZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716401532; x=1717006332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AugUKhaYwKDJ/9b03MK/LG9RwwxS/6pxd40CuSzPjmc=;
        b=UA+xJKiIzEYtOQNTIuPON5yLXlIkSMnjKTAMPcjD5esYlsOS7peIiPQvUg+ys8jX6x
         JfiVriMyLSCIJ5YF86rHLp7iFIae6iZ5XOabSWG+m8bvcwOu5oz8Q73MmpfHF7j0q9lP
         CrfUKzqgun/39L65L2VVPR2DjnWl9G4F61wZ2Y0fqNLZgan0dgTRP1y/TIkQaE4iO40n
         JHOCxoN0Uj7sYUcevRRddUCi+ZCESCxF1U6DP4c6LlkyB5DCpQI4/lYUzhLdrvWALdpP
         KNwgC6LbgI7U3ttdjLDF+eJBNkYMPidNdNXUFHZ2R7ghZfFRwU6mBP4r0bJEqxjQ8JUy
         qb/A==
X-Forwarded-Encrypted: i=1; AJvYcCXdfziMsuNSPibYj3X4fZ0h3UW9EW6gi1O4/bb3BS4hS8YERQSii7+wXwplWrM+oeYSY8yPAmRaJmRzjT/HbYV4Kgjd4VIp
X-Gm-Message-State: AOJu0YyVdTCDiRVs2g9XmKoaQ2zOX95FrRBorFp15m7hRvf3ufEceXFV
	XFE5jRIb+nRPnwXsbcBVyBVZ9Uej7NWe4wE0u4ERjHP5Xbb6hHS1P5h1WU+1lXCMdw8NuD+e9u7
	f3Fe1bg==
X-Google-Smtp-Source: AGHT+IFUSfqO6cLCD8ngz7FKUfF0Nqv8hePrUmvEKl/4QQMG8mXylsFj1uBgcWmP07HuzQdMaLw8qg==
X-Received: by 2002:ac2:5312:0:b0:524:473f:8da5 with SMTP id 2adb3069b0e04-526bf922032mr2382674e87.40.1716401532210;
        Wed, 22 May 2024 11:12:12 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7d7csm1833647366b.140.2024.05.22.11.12.10
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 11:12:10 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-572a93890d1so11701810a12.3
        for <oe-lkp@lists.linux.dev>; Wed, 22 May 2024 11:12:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEGeOIWpEd8oJbX2F0VhTmXplAk23zgZpJ7AYTlnB85Y/u27VT+bACO3Hj/COetkSz3/XU6JCMlg32cmoYyMttAOqkD4T9
X-Received: by 2002:a17:906:488:b0:a59:b1cf:fea0 with SMTP id
 a640c23a62f3a-a62280d5059mr234104266b.19.1716401530325; Wed, 22 May 2024
 11:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240515091727.22034-1-laoar.shao@gmail.com> <202405221518.ecea2810-oliver.sang@intel.com>
 <CAHk-=wg2jGRLWhT1-Od3A74Cr4cSM9H+UhOD46b3_-mAfyf1gw@mail.gmail.com> <Zk4n1eXLXkbKWFs2@casper.infradead.org>
In-Reply-To: <Zk4n1eXLXkbKWFs2@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 May 2024 11:11:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgdm4SN_ofM1gFuF7CTRgVcbAGuopgS3NWP04zRCn_SKw@mail.gmail.com>
Message-ID: <CAHk-=wgdm4SN_ofM1gFuF7CTRgVcbAGuopgS3NWP04zRCn_SKw@mail.gmail.com>
Subject: Re: [PATCH] vfs: Delete the associated dentry when deleting a file
To: Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <oliver.sang@intel.com>, Yafang Shao <laoar.shao@gmail.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, Al Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Waiman Long <longman@redhat.com>, 
	Wangkai <wangkai86@huawei.com>, Colin Walters <walters@verbum.org>, linux-fsdevel@vger.kernel.org, 
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 22 May 2024 at 10:14, Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, May 22, 2024 at 09:00:03AM -0700, Linus Torvalds wrote:
> > Of course, if you do billions of lookups of different files that do
> > not exist in the same directory, I suspect you just have yourself to
> > blame, so the "lots of negative lookups" load doesn't sound
> > particularly realistic.
>
> Oh no.  We have real customers that this hits and it's not even stupid.

Oh, negative dentries exist, and yes, they are a major feature on some
loads. Exactly because of the kinds of situations you describe.

In fact, that's the _point_. Things like PATH lookup require negative
dentries for good performance, because otherwise all the missed cases
would force a lookup all the way out to the filesystem.

So having thousands of negative dentries is normal and expected. And
it will grow for bigger machines and loads, of course.

That said, I don't think we've had people on real loads complain about
them being in the hundreds of millions like Yafang's case.

> plan9 handles this so much better because it has that union-mount stuff
> instead of search paths.  So it creates one dentry that tells it which of
> those directories it actually exists in.  But we're stuck with unix-style
> search paths, so life is pain.

I suspect you are just not as aware of the downsides of the plan9 models.

People tend to think plan9 was great. It had huge and fundamental
design mistakes.

Union mounts =C3=A0 la plan9 aren't hugely wonderful, and there's a reason
overlayfs does things differently (not that that is hugely wonderful
either).

             Linus
