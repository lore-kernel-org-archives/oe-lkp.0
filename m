Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1A558AB6
	for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 09:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706605946; cv=none; b=pbWJDn8cqHLxF9z3Yl+/MpNSq/wtcOyaP1bo3oiUeHLsn0xpLqzrtRCutDq9KtT2qAlKrM0Uz8hsWUYO2AOiFbEfan2JsGqvy7QfHMbASofoJw/gynHT8/IjgZBMYZsC+hI1oCjqKeyqkMnPGxEekWWqdrMj7HxbcyGZa+l2fgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706605946; c=relaxed/simple;
	bh=2DIY+lL0JwPloAko6mVPmoNJ4C898Ios+yVnwFsSQws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sT6/BXsDXx3Yh0eoLaFCyftJSs/mhlaKXWLS+fKbaqr/7vfhhDwZUP0hZ5M3Hgc2cTuHH5NUicpUJ91jBnLyMq+eHGAUTDsG5wpAyNxVd/BRb88YDzbSoh8mqEPTwAAPqsnadvfvtysJ8/4x0uxUP5u7EYx8WdDLIFWSG3tWaak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=MAKj+Zij; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MAKj+Zij"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so4704520a12.2
        for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 01:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706605942; x=1707210742; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ62OXvXVngPLK5bvC/N3snsj6IMt9f3ZjXYsKK3MQk=;
        b=MAKj+ZijOB7inso+lSU2tERrY7bBNbCGM51Id3JO56SSnwSR7bbwlmUCAPqwDFDAWo
         rFaafGyMDSDZWmBH78Lsh7cvxvYN/gKeA3zUVsutVTNweeygT+hedkPm5WbR+aeNk5Hz
         a3Cr0GS+7U/IrsDkn6N5nlo2GJEXLrW6fx/Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706605942; x=1707210742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJ62OXvXVngPLK5bvC/N3snsj6IMt9f3ZjXYsKK3MQk=;
        b=ELWV53Nw7paT1mPWdIIObVGhhsgwyek5pAVBPnUoD4WE4ABfpf+YzHvJulLrzvJLRq
         6mqSfXJo16vxYWXfh9MvBG2fWX/LbZl7qfPJAfVrXxlR1v7UCMpCraj6eBUki/spydEb
         RgdeeROdfA1tq6/AwWxwQlk8LjRQ1hT0NkIqVYpgnxtl+ABDZ8Q4JOQDtgbnaPr6A6ZZ
         gW4E/uADq79AXmQ6uyWQ1WhAdr/GG8wNJFtzd9FSgBjjONIMJNpP5kkwc2PWo1DDNdE+
         yVE1VKBZqTT1RWji7D317etBV0vQS3a1VtZamZy7bq6vueoCodMBrNTCqO7dUpYXUPUJ
         vCRA==
X-Gm-Message-State: AOJu0Yx5QoT+wAuhdoYoLNeExrRTUJXaDUaLPG9tIKHOWPY57qZ9OJDP
	WJ3kISytnNnn/Tn4fAE383eBmPOEICAHvCC5qfI/gSQL2srsymuBHHjf1rUBp2TFAi0Lrl5/j6X
	8K0U=
X-Google-Smtp-Source: AGHT+IHRuorMvypcFWBPq2rsabNI//DZTI/DQy3cPxMJmPos+HwLL9cf2ML0Qwck/EEQupB80PRgrQ==
X-Received: by 2002:a17:906:e5b:b0:a35:c8ce:ca0f with SMTP id q27-20020a1709060e5b00b00a35c8ceca0fmr2836883eji.24.1706605942482;
        Tue, 30 Jan 2024 01:12:22 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id cw4-20020a170907160400b00a3611f17180sm695246ejd.55.2024.01.30.01.12.21
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 01:12:21 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55ee9805da7so2647740a12.3
        for <oe-lkp@lists.linux.dev>; Tue, 30 Jan 2024 01:12:21 -0800 (PST)
X-Received: by 2002:a05:6402:1910:b0:55e:f740:4f39 with SMTP id
 e16-20020a056402191000b0055ef7404f39mr4388911edz.22.1706605941604; Tue, 30
 Jan 2024 01:12:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401291043.e62e89dc-oliver.sang@intel.com> <CAHk-=wh0M=e8R=ZXxa4vesLTtvGmYWJ-w1VmXxW5Mva=Nimk4Q@mail.gmail.com>
 <20240129120125.605e97af@gandalf.local.home> <CAHk-=wghx8Abyx_jcSrCDuNj96SuWS0NvNMhfU8VjFGg9bgm_g@mail.gmail.com>
 <CAHk-=whb91PWEaEJpRGsuWaQpYZGj98ji8HC2vvHD4xb_TqhJw@mail.gmail.com>
 <CAHk-=wgp7UkG31=cCcbSdhMv6-vBJ=orktUOUdiLzw4tQ4gDLg@mail.gmail.com>
 <20240129152600.7587d1aa@gandalf.local.home> <CAHk-=wghobf5qCqNUsafkQzNAZBJiS0=7CRjNXNChpoAvTbvUw@mail.gmail.com>
 <20240129172200.1725f01b@gandalf.local.home> <CAHk-=wjV6+U1FQ8wzQ5ASmqGgby+GZ6wpdh0NrJgA43mc+TEwA@mail.gmail.com>
 <CAHk-=wgOxTeTi02C=kOXsHzuD6XCrV0L1zk1XP9t+a4Wx--xvA@mail.gmail.com>
 <20240129174950.5a17a86c@gandalf.local.home> <CAHk-=wjbzw3=nwR5zGH9jqXgB8jj03wxWfdFDn=oAVCoymQQJg@mail.gmail.com>
 <20240129193549.265f32c8@gandalf.local.home> <CAHk-=whRxcmjvGNBKi9_x59cAedh8SO8wsNDNrEQbAQfM5A8CQ@mail.gmail.com>
 <CAHk-=wh97AkwaOkXoBgf0z8EP88ePffLnTcmmQXcY+AhFaFrnA@mail.gmail.com> <CAHk-=wi6m7d-nivx10Lo=aGhbdk2qg-8SzjtDd9XW01LxGgAMA@mail.gmail.com>
In-Reply-To: <CAHk-=wi6m7d-nivx10Lo=aGhbdk2qg-8SzjtDd9XW01LxGgAMA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 30 Jan 2024 01:12:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi+WbXZcc2Sx1i-MGV2DfG4eS4Ci+mrqi-PBSLSnww6qA@mail.gmail.com>
Message-ID: <CAHk-=wi+WbXZcc2Sx1i-MGV2DfG4eS4Ci+mrqi-PBSLSnww6qA@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jan 2024 at 00:43, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'll go back to bed, but I think the fix is something trivial like this:

Almost.

>   +     result = ERR_PTR(ENOENT);

That needs a '-' in front of the ENOENT, otherwise you have a positive
error number and things go wrong very quickly.

And that does indeed fix the lookup problem, but you end up with the
same problem later when you do the eventfs_remove_dir(). Again the
eventfs data structure changes, but we don't have a reliable dentry
that we can invalidate.

The dentry cache is just very good at caching those old dentries, and
the interface for eventfs_create_dir() and eventfs_remove_dir() is
just not great.

If those did an actual path lookup (like eventfs_create_events_dir()
does), we'd have the dentry, and it's trivial to get from dentry to
eventfs_inode.

But going the other way is the broken thing because of how the
dentries are just temporary caches.

I suspect the solution is to make eventfs_create_dir() do the same as
the events directory case does, and actually pin the directory dentry
and save it off.

Oh well. At least I understand what the problem is. Now I'm going to
try to go back to sleep.

              Linus
