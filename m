Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DE1524A1
	for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 22:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706567758; cv=none; b=R+l3oLimXkKJh1FkN7Ql2zeydVKWWcm/MbvCymPkIKQmnDheaylU7I/CiPmK80D4kh5mZYsBvTkyym4sAUbmpaVhbxs3pd4pIqxWaaFAapPUdM85U7jDp17hZda0tj1rnbE7/Ww/kvOm69jrl/3UbMLya1h2sHj0mcE6KDCLg3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706567758; c=relaxed/simple;
	bh=VnTiScXQo7bZZSg4GpsGPNgsG9aIQqnuAmV4bkEVHE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/L2k957VUELg3xGk9+Nq3or/B1EILIxxR6AQojyh8tLBVVO0weKHqc9n1R7IXzhyC23F3+44hq2Ro+IL5fb2XR4BblQyJsGDxkgoY/FBOybKsqIpG+Pt1qBihN+EpP7Jn7HIavs/Q4q8sIps3E+ZcIskA3+w1mu+Z+s0UZwjwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=P+C8Nvu7; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="P+C8Nvu7"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51025cafb51so4637309e87.2
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 14:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706567754; x=1707172554; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1hj+C8eVFms56HSNUtGD4vDso2zbX9G6i0iFWoHn8+w=;
        b=P+C8Nvu7A4oC/KUOiEO+dNUtzyKSrq8fM4zVMTpsn2t5rsAP2lw73hHPrGcay2TG7o
         GSujkcb6j6+8HiHy0nefo8Wlwim2PFwkYikj1FETUenrsLaNXXw+2sCU5vn67Dl8Hd6p
         Hrrs3+J1rhxXiZlexYIcuzr3n7EjkMTe/2Xec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706567754; x=1707172554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1hj+C8eVFms56HSNUtGD4vDso2zbX9G6i0iFWoHn8+w=;
        b=JFuG3d+tfXOcrxDeELt6cmE5dyoYWmlT78Gnrpw9JFu3Qwup8rXrJnhTKeoxT9lRFp
         BfuVkusDZy81AVApxrgbOP0AWaBVdIn5/BQIvpB/obNAwsrOvBCPvHYUdhWNuE7GzvDA
         tHA9C2CLveeggcmYUgraCg/uR+Fp1jYLi1vjr+a/31eqf5AuONepjjumBGndrkh5sO6Q
         +x0PUzTIDwZqi/opzJB7fN4JOszbqErrFEZXDhmJnl2s+asniTRxSBSe7g28bX+0bX04
         2JIAn2E1WFkDgdKIaUkg4W+rSzLk/ppD/cih+SZL+bsWb5SCfHBB1+jfn3TTLnjq3th6
         QAIA==
X-Gm-Message-State: AOJu0YwUZxrLqohA49K1uCjh7sl5oSqnB0qE7mrr5l5gKFg0+ZdMzf+2
	40tJh87d6OVedkspxcsQIVcUcHNDVfXOBNAdI8FbLTCKlwxuD8aN9mdzLnFrop5xDMLuAsjLSUj
	EftyoSQ==
X-Google-Smtp-Source: AGHT+IE3VUoXbSGpxXlMgPWn/cGAxWl5GUX/9dNYZP4pMdUJBa7+f4zrbojKUU21UhlWrwkea4cc8g==
X-Received: by 2002:ac2:4e08:0:b0:510:c48:e5de with SMTP id e8-20020ac24e08000000b005100c48e5demr4811029lfr.57.1706567754633;
        Mon, 29 Jan 2024 14:35:54 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id e25-20020a196919000000b0051025648d12sm1262219lfc.86.2024.01.29.14.35.53
        for <oe-lkp@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 14:35:54 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d04c0b1cacso17398341fa.0
        for <oe-lkp@lists.linux.dev>; Mon, 29 Jan 2024 14:35:53 -0800 (PST)
X-Received: by 2002:a2e:9a93:0:b0:2cf:22f1:bd5e with SMTP id
 p19-20020a2e9a93000000b002cf22f1bd5emr4180113lji.44.1706567753589; Mon, 29
 Jan 2024 14:35:53 -0800 (PST)
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
 <20240129172200.1725f01b@gandalf.local.home>
In-Reply-To: <20240129172200.1725f01b@gandalf.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 29 Jan 2024 14:35:37 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjV6+U1FQ8wzQ5ASmqGgby+GZ6wpdh0NrJgA43mc+TEwA@mail.gmail.com>
Message-ID: <CAHk-=wjV6+U1FQ8wzQ5ASmqGgby+GZ6wpdh0NrJgA43mc+TEwA@mail.gmail.com>
Subject: Re: [linus:master] [eventfs] 852e46e239: BUG:unable_to_handle_page_fault_for_address
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Christian Brauner <brauner@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 14:21, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> But crashes with just a:
>
>  # ls /sys/kernel/tracing/events
>
> [   66.423983] ------------[ cut here ]------------
> [   66.426447] kernel BUG at fs/dcache.c:1876!

Duh.

That's a bit too much copy-and-paste by me.

So what is going on is that a ->lookup() function should *not* call
d_instantiate() at all, and the only reason it actually used to work
here was due to the incorrect "simple_lookup()", which basically did
all the preliminaries.

A ->lookup() should do 'd_add()' on the dentry.

So just replace all the d_instantiate() calls there with "d_add()"
instead. I think that will fix it.

Basically the "simple_lookup()" had done the "d_add(dentry, NULL)",
and at that point the "d_instantiate()" just exposed the inode and
turned the negative dentry into a positive one.

So "d_add()" is "I'm adding the inode to a new dentry under lookup".
And "d_instantiate()" is "I'm adding this inode to an existing dentry
that used to be negative"

And so the old "d_add(NULL)+d_instantiate(inode)" _kind_ of worked,
except it made that negative dentry visible for a short while.

And when I did the cleanup, I didn't think of this thing, so I left
the d_instantiate() calls as such, even though they now really need to
be d_add().

Hope that explains it.

And I hope there aren't any other stupid things I missed like that.

         Linus
