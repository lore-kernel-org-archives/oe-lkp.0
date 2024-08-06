Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0996E1CFA9
	for <oe-lkp@lists.linux.dev>; Tue,  6 Aug 2024 02:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722911043; cv=none; b=GnFL4XRidOhaqPzNMAK9SsFXz/hvKcTTjrZikVRsM2+maOECC3dV4H9pU0GbgaSHi4SGd48S7uUzkEQe5uLFmKZ0ReTVIuS/CYc/fp7IKwT2568w+ijA89M1/dTRmwzOX9nhUYT6CveotvkQBbjn8jpLsN5VZT0tz/xXJq2oerM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722911043; c=relaxed/simple;
	bh=a9Vp+4x2A4ioCvdcdJD7sOUfBOazJEHoNcUHQ9qx7zA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u2GhOkPdqK8ro+Ui6NVC6LZPXaqrZ3Dfi2iN5LdEgFJPbTWa69XBi3wEINjZY9C0NID8eD7fg9+0L+46AfPwV0JHewx857EpqNcThus6cTvZwtTycuX/ETfpRoAfQAFCVHMuDKRQ/M9BLkeDRtCp40sMADKDGxY02r9jvxfD7Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hOUX3Clb; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hOUX3Clb"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7aa4ca9d72so4302466b.0
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 19:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1722911039; x=1723515839; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LIFbxMpiXxHdMqbCN+3/gUCx3hbdMfLnZFy+ZXlHFxY=;
        b=hOUX3Clb7dujXiy9kS09+FJFdIXIenLudDX8NUyClCpXDu2kWsF478EzzByyZgitu3
         GKLcIvERkl+WZuS3AbxKEeiVp0nVGOGFi0kfrMM6sikt+eMDuw8r7Ykz7SDhy9iUhoMI
         ZfyivdoAW97RH91d5y7Uq6ZaoYtH4o8z7PT08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722911039; x=1723515839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIFbxMpiXxHdMqbCN+3/gUCx3hbdMfLnZFy+ZXlHFxY=;
        b=TyS599Xu2VWElCW7jPn0m2Rkm/RYFFQglXXWZzFwY+7yAKY4u+z3K5OWi3FrsIrFE5
         hMVBkg3yxyEPbM0GvoG7tq+Pr5N85yhHFYcEyOUGxQPFkxil4luzCLGTRGFQVjC2GJmg
         PWCRU6LRHsNcu8csQgO64AfHeD8uyyKOGsWz1skJPEe3sp4XFyjN/Bt/AHXtqUPzfUJj
         tptR7HVzsXoK89ZDcjWudTN0D5mZbesUnI60k0tT/0+01j0kw/+Lmzf33e/gOub83uc2
         O100ZKaRvL3bNaMKGwoCmekSiaF8VKm6jbjUvFd9re6c3aZgG5GRDER2xiykm/UKudiV
         SlSA==
X-Forwarded-Encrypted: i=1; AJvYcCWOrZtPIEMMKWlzA+UE6KAWzCHuPPEwWl5ZbolKeCVZt1rIVU0gtTyw62yHAJT0Zd3Fx9OOzQTS3DajWjDABQNwf7AXQWD8
X-Gm-Message-State: AOJu0Yyrp11Z0xgRaLcHdTNhunVL1yCccvOK0upH6r3Gu9RLASxlRuF4
	Xn60pj4rLgAfKLvJKoP9qPesF77m5uPA1uzBVr2yBW0O6WwT4rUV9xlySlwNRkpZs+fkls06Esv
	2d390zA==
X-Google-Smtp-Source: AGHT+IG1Psh1e7DL9CHAMsWcsPeB3lFe5m0dV+YcF2VSu2sWXec7keoy3t58vuj9E4c3gCXKOtUHOA==
X-Received: by 2002:a17:907:d29:b0:a7a:c812:36bb with SMTP id a640c23a62f3a-a7dc4da6efdmr1151705866b.8.1722911038926;
        Mon, 05 Aug 2024 19:23:58 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d4378fsm503612466b.117.2024.08.05.19.23.58
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 19:23:58 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5bb477e3a6dso62102a12.0
        for <oe-lkp@lists.linux.dev>; Mon, 05 Aug 2024 19:23:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWEP2RN/3i4bFEjxJoZ9sckGytRfjCX48D/owurCAoj/UmTyRLcuEIQ1Ip05zQWSf1Kqw8s1X2XHTprfwIEwL7bpiDgBYBu
X-Received: by 2002:aa7:cb43:0:b0:5aa:19b1:ffde with SMTP id
 4fb4d7f45d1cf-5b7f59e20a8mr9459334a12.34.1722910549350; Mon, 05 Aug 2024
 19:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408041602.caa0372-oliver.sang@intel.com> <CAHk-=whbxLj0thXPzN9aW4CcX1D2_dntNu+x9-8uBakamBggLA@mail.gmail.com>
 <CAKbZUD3B03Zjex4STW8J_1VJhpsYb=1mnZL2-vSaW-CaZdzLiA@mail.gmail.com>
 <CALmYWFuXVCvAfrcDOCAR72z2_rmnm09QeVVqdhzqjF-fZ9ndUA@mail.gmail.com>
 <CAHk-=wgPHCJ0vZMfEP50VPjSVi-CzL0fhTGXgNLQn=Pp9W0DVA@mail.gmail.com>
 <CALmYWFuCvphvLQOuQHBbFq0G8Ekyze=q45Tt4dATOt-GhO2RGg@mail.gmail.com>
 <CAHk-=wgySgXXkZtx49Xq70X2CmSizM8siacYKncMmFWRzKjs5Q@mail.gmail.com>
 <D38D6LJZOIQK.2GV58PGVL5K85@gmail.com> <CAHk-=wjeWqr+0Ktzbwqrw17aESe5dZm5Kt6nwqtKJX00VsDqWg@mail.gmail.com>
 <87r0b2if4t.fsf@mail.lhotse>
In-Reply-To: <87r0b2if4t.fsf@mail.lhotse>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 5 Aug 2024 19:15:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wibKvw92keueGCUpr428BvhgEwoJxXow2NyBq2LiRGhFw@mail.gmail.com>
Message-ID: <CAHk-=wibKvw92keueGCUpr428BvhgEwoJxXow2NyBq2LiRGhFw@mail.gmail.com>
Subject: Re: [linus:master] [mseal] 8be7258aad: stress-ng.pagemove.page_remaps_per_sec
 -4.4% regression
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>, Jeff Xu <jeffxu@google.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Pedro Falcato <pedro.falcato@gmail.com>, 
	kernel test robot <oliver.sang@intel.com>, Jeff Xu <jeffxu@chromium.org>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Dave Hansen <dave.hansen@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Jorge Lucangeli Obes <jorgelo@chromium.org>, Matthew Wilcox <willy@infradead.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, =?UTF-8?Q?Stephen_R=C3=B6ttger?= <sroettger@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Amer Al Shanawany <amer.shanawany@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	linux-api@vger.kernel.org, linux-mm@kvack.org, ying.huang@intel.com, 
	feng.tang@intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Aug 2024 at 19:01, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> >
> > I just don't quite know _why_ powerpc cares.
>
> AFAIK for CRIU the problem is signal delivery:

Hmm. Well, the patch I sent out should keep it all working.

In fact, to some degree it would make it much more straightforward for
other architectures to do the same thing.

Instead of a random "arch_munmap()" hack, it's a fairly reasonable
_install_special_mapping() extension.

That said, the *other* thing I don't really understand is the strange
"we have to set the context.vdso value before calling
install_special_mapping":

        /*
         * Put vDSO base into mm struct. We need to do this before calling
         * install_special_mapping or the perf counter mmap tracking code
         * will fail to recognise it as a vDSO.
         */

and that looks odd too.

Anyway, I wish we could just get rid of all the horrible signal restore crap.

We used to just put it in the stack, and that worked really well apart
from the whole WX thing.

I wonder if we should just go back to that, and turn the resulting
"page fault due to non-executable stack" into a "sigreturn system
call".

And yes, SA_RESTORER is the right thing. It's basically just user
space telling us where it is. And happily, on x86-64 we just forced
the issue, and we do

        /* x86-64 should always use SA_RESTORER. */
        if (!(ksig->ka.sa.sa_flags & SA_RESTORER))
                return -EFAULT;

so you literally cannot have signals without it.

             Linus
