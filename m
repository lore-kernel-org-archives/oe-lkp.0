Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB26E1DEFD4
	for <oe-lkp@lists.linux.dev>; Mon, 20 Jan 2025 11:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737372455; cv=none; b=aNRK4OOC9dyjbikWD4Xv6ZTkwYegze2pnqVBQcb33xMn50ddgS/LNFzo3F5UeWus0shn0CoUW4ajYuv9VFtwqVyvh4+O5xJ8cGy/pR9+yG4Ef/ifFvQM2hwA4jLPLTC/l4MxaVtacUSdOtrJipFKjvTyxZxDdyd8KcN5HSNbi8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737372455; c=relaxed/simple;
	bh=eDzPK2Bm2PFmDC/i1fKDiiNiM0ZATZasOPEgFiZV8Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzowj1zbSUlLc6UAtfXi/E9ShNXPmFVKvU0PSZdtRKu5T5dfC6VXV9zZCoV5INZ2XV1IDGBYdv9eLLaAN6uxNqa/Snn4cScpnKzwJwo4Xb9/uWO2ByKXSGMOJ/0RxPE4rcGtPvhxNkFktggfy78JJAi12c1GT/RkRt036Bp79hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSJIamlO; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSJIamlO"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3bbb0f09dso7582984a12.2
        for <oe-lkp@lists.linux.dev>; Mon, 20 Jan 2025 03:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737372452; x=1737977252; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g1J734iUT/E12Vp8hXExUgs1BjaEHBnMERq/1efVWRM=;
        b=DSJIamlO1dj2PNoch6sytJ1pydagSlRFM6rtOhxKORJnUNJrJSIHESv7+kZAum8mSB
         uKq04Is9UAjA7Awqs6z1ELrp8atNGMa541JL8JdZIA41XktjE0ruVsFZ+/uatZ23es3B
         4oXIO+nYFLwiJtf6hA/PeLSLXFu76lxywS2D7z3GLdAttsnQpn/gpMdUGrI+6A+iNywo
         J208+I7211KNsT/e1hQlUQd/5L74UbW2i47ws1yfop/JU1wdMhpqZPgegAWz6rgJbwqg
         Mhu9b6LBvMH3Jiibe7IJBSuDPqnYHvHsUGvED7be7SVQahJ6wQs2EZwuGsium1JwdVwO
         pfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737372452; x=1737977252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1J734iUT/E12Vp8hXExUgs1BjaEHBnMERq/1efVWRM=;
        b=AsCh0JpPM+AuhBfFS7MCdqK3t7mXydkWWVmXnWctdx6QKyhGHX5HUwU/AacjMAzjz4
         oPKk9MDMTZ2BF+EtnA81YpnQ9u2pFLcQMY6Hh8flufJnKYddHaciEkNRxvMH5aeVUd4L
         IIo6rpmawBiUgk8PSV5TryecGueYTyLKWJDEt5LshgV8Jj0uMshH8IU7VdiP7BlrVqoY
         k1nBNefQ4yTK8tf0sHFxbBkwSehGT2wjQLRRYv7SE8KrIhgJuw7aN+WFPfpDmM3xyVHT
         btQurqZDK3oOZCT4nvQKcTklFKmuabWGfkgOsj3PWaaf+gBhvQn/ArOQumP52F8GIXxR
         0hgg==
X-Forwarded-Encrypted: i=1; AJvYcCVOLDBA2ppz8vPbHM6/WASCt1nrItdA4G5yLrBZiUCqyucozZDLMtsUTvSOThBJvnjZxgHYAI0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2JZRlTHPsBjAxAX6YTabZ5H+3ep/ZURsUGcg8UHqOOtRnAYqj
	iAHSiYOVeoUJf+5ieqowPz8uG/MR5Kuht9Yg0aPjhNAyHG+l9fZk
X-Gm-Gg: ASbGncvAovxP19UiCYyoTlHmz/dHnGCClCqxnIo6vYvwIOrgOUFdyhZblQ4UM90JL/z
	0n5bE9pKxl++omQwpAe+cDiHY0aJoCF47A+qhKKa9qSH3O3MgxFsyBMo2xJ/QIb9g31iuixPx7T
	RnpU9Lg3n6UtpOjHCTpMBBtfPFNg78rGcszrPohJsvurh2DxIymoFfqiEqx/T3TDWEYlvr+UE+/
	yRPiSN6mSVkQ1ejosNBjxkdIImAhH29P5AhbDAswK/I18vO4LzauJT6MtAOhZzEMt1e8O4lfCsc
	jWJ9E19KdA==
X-Google-Smtp-Source: AGHT+IHg8PVEZ7sSOuGkt6DK06J/HPz2kSh6wF71+iUn0z+46bcE5+bmmgzLL1yrdZHbDhy3Rw1fXQ==
X-Received: by 2002:a05:6402:51cf:b0:5db:68ce:2125 with SMTP id 4fb4d7f45d1cf-5db7d2fe208mr11811411a12.14.1737372451798;
        Mon, 20 Jan 2025 03:27:31 -0800 (PST)
Received: from f (cst-prg-69-191.cust.vodafone.cz. [46.135.69.191])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73683e1asm5435955a12.39.2025.01.20.03.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 03:27:30 -0800 (PST)
Date: Mon, 20 Jan 2025 12:27:21 +0100
From: Mateusz Guzik <mjguzik@gmail.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Oleg Nesterov <oleg@redhat.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	Christian Brauner <brauner@kernel.org>, WangYuli <wangyuli@uniontech.com>, linux-fsdevel@vger.kernel.org
Subject: Re: [linux-next:master] [pipe_read]  aaec5a95d5:
 stress-ng.poll.ops_per_sec 11.1% regression
Message-ID: <leot53sdd6es2xsnljub4rr4n3xgusft6huntr437wmaoo5rob@hhbtzrwgxel2>
References: <202501201311.6d25a0b9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202501201311.6d25a0b9-lkp@intel.com>

On Mon, Jan 20, 2025 at 02:57:21PM +0800, kernel test robot wrote:
> we reported
> "[brauner-vfs:vfs-6.14.misc] [pipe_read]  aaec5a95d5: hackbench.throughput 7.5% regression"
> in
> https://lore.kernel.org/all/202501101015.90874b3a-lkp@intel.com/
> but seems both you and Christian Brauner think it could be ignored.
> 
> now we captured a regression in another test case. since e.g. there are
> something like below in perf data, not sure if it could supply any useful
> information? just FYI. sorry if it's still not with big value.
> 
> 
>       9.45            -6.3        3.13 ±  9%  perf-profile.calltrace.cycles-pp.pipe_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
> ...
>      10.00            -6.5        3.53 ±  9%  perf-profile.children.cycles-pp.pipe_read
>       2.34            -1.3        1.07 ±  9%  perf-profile.children.cycles-pp.pipe_poll
> 
> 

Whatever the long term fate of the patch I think it would be prudent to
skip it in this merge window.

First two notes:
1. the change only considers performing a wake up if the current
source buf got depleted -- if there is a blocked writer and there is at
least one byte in the current buf nothing happens, which is where the
difference in results is coming from
2. stress-ng is not really a microbenchmark suite. it is more of a "do
stuff, some of which may accidentally line up with isolated behavior
from real workloads and return ops/s". plenty of it does not line up
with anythinig afaics (spoiler for tee improvement below).

So, I had a look on a 24-way system and results are as follows.

1. tee (500% win)

It performs tee/splice of a huge size along with 16 byte reads from
another worker.

On a kernel without the change this results in significant lock
contention as the writer keeps being woken up, whereas with the change
the bench gets to issue multiple reads without being bothered (as long
as there is any data in the buf).

For a real program this is more of a "don't do that" kind of deal imo,
so I don't think this particular win translates to a real-world benefit.
(modulo shite progs)

2. hackbench (7.5% loss)

lkp folk roll with 128-way system and invoke:
/usr/bin/hackbench -g 64 -f 20 --process --pipe -l 60000 -s 100

Oleg did not specify his spec, I'm guessing 4 cores * 2 threads given:
hackbench -g 4 -f 10 --process --pipe -l 50000 -s 100

I presume the -g parameter got scaled down appropriately.

So I ran this on 24 cores like so:
hackbench -g 12 -f 20 --process --pipe -l 60000 -s 100

to match

This is spawning a massive number of workers (480 in my case!) and there
is tons of lock contention (go figure).

I got a *massive* real time difference:
23.63s user 270.20s system 2312% cpu 12.71s (12.706) # without the patch
30.40s user 406.97s system 2293% cpu 19.07s (19.069) # with the patch

According to perf there is a significant increase in time spent
performing wake ups by the writer, while the reader is spending more
time going off/on cpu in the read routine.

I think this makes sense -- on a kernel without the patch you are more
likely to get extra data before you drain the buffer.

As for the specific difference in performance, per the above all this is
massively contended and the wake ups are going to alter which locks are
contended to what extent at different scales.

I fully concede I'm not all confident hackbench is doing anything
realistic, but I'll also note waking up a writer to get more data seems
to make sense.

To sum up, the win was registered for something which real programs
should not be doing. Seeing the loss in other benches, I think it would
be best to just drop the patch altogether.
