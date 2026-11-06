Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793972708;
	b=MihLWoaqUbtQt+q3OIjQKAMzyUG1cGtUq89gHN3fA+JygXCVeV3TyTDmj8g2pnm7ZwDM
	 BuT/PxnB69JqK3ga7+GQkVNC8dHAgyf8Ios7H8cDCGlh8Tec874KQi9qqwo+Px8kM3q0q
	 TefToxyPPK7KJArGEL0XuTWzDJbG9znmRzreX9SO8Q+j6nU8Gzokk9JOHGq7WDrO4DUW+
	 RyBU76jSAXP2PFC2ZxXjgOY1EdHvGpWWG3sE/L3O8GoRvxuow7sG1e9wQ6X+OuzocIaYa
	 vv4M3fsPrVVNwjm1BferG7I7wp8srNqupaImylpush4S1VVWBkCNy+j+c2LKkYLINfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K63SRYXJYnToUzmwwdizK3xJn9h0hSaj5lF2H2514zI=;
	b=Y865lyIz1SkcdL5XW4T8Ek4VvOkbdRcrvzRoAcYcf5v5ABGUX7LcuWKgbyhBbq/pYKd0
	 5pELfnxTCCgdOlIfYAIzetLRxz2VhCCjEAPkD9JuJlak9BYNxLqISOLSdv1Q0THgRbdur
	 rXTYUHaAEw2pfrnWyr6u1QNb9Fcm0mr2TblBUpUr1IrRr2MwjDipS20Y19aE8v/jiEg6/
	 jniCnvhUqaSAgXje0013rg61ZQLbvCyrwZITsBYzsulGEVDj1X5/6nR1D0m8yk0tGadM0
	 i7vl9vS6DsDG8+IhnieBJebXjOu/YU6I7647yZQKoCo7RrsMV5jaCwEgxc8ruBj+9bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaLtDaL3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817C7606EE8E
	for <oe-lkp@lists.linux.dev>; Fri,  6 Nov 2026 13:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817C7606EE8E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaLtDaL3
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so631569a12.0
        for <oe-lkp@lists.linux.dev>; Fri, 06 Nov 2026 05:45:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793972707; cv=none;
        d=google.com; s=arc-20260327;
        b=VHs3TCKUE5L2OBGi2WW7Ns/HJxqqojGGtWhouTjqO2IpIPAkfYkQvgk9f+STU4I8Wv
         kDDbzjw5JrLSsx5Y2Esa2ysBZ/XsfSF9NnZ6jEG3WT9GLL9v2gpMC8h2uE4S4uReiX3S
         dlLFapKOsYPFJM8wBL++Ljm9BPp9hKauVd9R9hJX6n7+iT8mXBhNWVZk3kIxUsO7+2fe
         4/XX81tJbYAnlrpNomKd9Od7N9iAZ4a3yTahRfMehIY5YgzlOmh/HfK668VMNtv6hao7
         bTamfAZDqrKJFsONo72yDUqyERoax1F1ToA8jh6gDtCkJD3ugLaUgioYO+r6VOj7nDBL
         Oiew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K63SRYXJYnToUzmwwdizK3xJn9h0hSaj5lF2H2514zI=;
        fh=3ftWvtdh9HcvWhrbeH/Yq543KUXI8mEKXFtzPhtCc14=;
        b=AE/2vEH288jC8w/Ys6G35QdW8PiTRNDabj/NooBIm+9sxCWTe0y17AvHAySHMjF21V
         yiLYJ39GZ8muRAxq8MUXSShCzzQUlFNX32cR8tqxc/NWZ7gJOdkOe9wtGonVMKlQvLOB
         KSc8RQ9zyBcjHlI0JXQX1G56ab31XW0C5lfRyuXKIdGHeg/tm/d3qRfrnP8rHpAnYlRm
         EC6aoDhc814R0/CB1DTlHH/nvcTU9W4mlI43nxctOO5tKfwqus+TzmrZBEOtuXQyQBjK
         fA+axSP8QWWXyd884vS9nELRAqzVzyC23r+KGQycZBmkcGKOoa/gF6hTy+yTV5PZj/O5
         JuDQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793972707; x=1794577507; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K63SRYXJYnToUzmwwdizK3xJn9h0hSaj5lF2H2514zI=;
        b=AaLtDaL3ExecXvKhjppsTEFyZKglxhrF6t82EO00OixKlpoVgt9XF4d6uLsXEo1Dne
         F0FUqS1Kny+EsOCaWXyteLi+0RDVxaxgYwegbLM6JWg9n9/d/2kI+wWJuqkp0dDmjody
         +28hCLu5CeaDQGsmCcSxYiM2tIBgJJy6Q04d6ZsHp13ttVpoP+aDXFwGvLhDnQJbTK5U
         F6hZexu4IV5Gz6MHN8PVbiK2lJ/DwXTkbL2cc1NhgQBq9tmuxeVasZ4/Tmmaf32k2VDk
         T7h3e8GTF0KzUjqw1tO4Kx6MNhSRQiPjzFEE5rCNSzVgOiAQ70BLnsd30v2cImmFa/M3
         0Y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972707; x=1794577507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K63SRYXJYnToUzmwwdizK3xJn9h0hSaj5lF2H2514zI=;
        b=DcVWF9ePF5Jm9Nu7q9YpZ1w++m0Qi0wNECXSThSJnrSgJ0dboG8JNkwRZfkCa/uuus
         9tGeDLDpgoaaGO2zAjQ0eNiL+Uw6EsC6cZgdBAQeSOoNTHEDW2UzNF7HGnDMafiqdbsk
         9zFR6RkC2DxPv1GPnQY0ZKtwSZvQ+H9O0ruX+unR+dmEoELQ/Jp0TSjox+NIvMi9LZI7
         UAVd61zDUk35nUGbAvhTvqZml96occeL7+DDi568E+vC9zSXwPqt7/n0420hwcZs9yAa
         XVKEV7T4M2dzRAIsyMsIlfOfn27O1XFbzPeeU4aUJiAatr7B4CJ9Js1StDyLQXGOZmR6
         yDRg==
X-Forwarded-Encrypted: i=1; AKwUvBz/ZYe7EV27j3FMDwp/wqnBDQtgZBk28qRIheUNCtpdTHpSNM4fcmwJGkYkJUBHV3+uXy8NMeM=@lists.linux.dev
X-Gm-Message-State: APuU4Z/unvitkZPVKlerH0Zi2juXulQUpZVPFZiAjFs3h3ZKA27w/KWG
	TK4kk59tqR9h4VQkXh2d420qRBs1/vNldMKKK9CW+Nqj4VT/tsPfFbWGqFe1hMS4biU1pk6/dIA
	wl/1fKJO+WVCrE8T530YHS3EoE3dQ/QI=
X-Gm-Gg: AYBFou0Fz9TGWfg0kuWPL1meCnbNH8wBC0M+h43i4xoBwdhDZR5PB8EdVQfVijDfZGB
	HY2erj9cAtINxT8HOT6Ia/hGOQA4pt5BKLcLdrBj4liG+4J4nCj7D2YYPu74p9Y32ASRf7i+0x4
	mX4v+X71o4wEplm8QW/HxD5olp9R3GpzDqUgrZrhmg/FOlzyswqM4AKLAkdw+fcwquJZI3ODokq
	yfvPB+THjLP0Z8G5CHLLJiX4cq03VMnw9gdntZcz9QiRMPiRIk1OOdJ5qt+1I95l3PkTuaRCEwq
	IhmhV1IyV6yp55d0I/0QxWi79sEIENuhsS27YoVhuPkN8La4lv8yHC7O5Y5uaAysET11/5PbFMx
	jl4hmzN9Q6/gBjw7ks5pXKWeRGwXtJbhagIRCM0YjDpYU586OXvRDbKTWTwzjSwbhty99ldpMzO
	2Qoh2ZYN1KHi7CbNhEAsKTpW1dB6jMRWQZ0pyumvAHTuRTwGiDnw==
X-Received: by 2002:a17:907:ea89:b0:c4c:bff4:200c with SMTP id
 a640c23a62f3a-c4d3531f031mr216233766b.32.1793972706561; Fri, 06 Nov 2026
 05:45:06 -0800 (PST)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <202611041404.befe64cd-lkp@intel.com> <20261105-trommeln-einspannen-radius-ccb4e174e407@brauner>
 <auygOHcuBba_o132@gmail.com> <CAGudoHFpNbxL13ZOWiyyLSPpmzXcB=e=RBZ8ZGk+Oc58Aad9pA@mail.gmail.com>
 <au2vjpu_yqNa83pN@gmail.com>
In-Reply-To: <au2vjpu_yqNa83pN@gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 6 Nov 2026 14:44:54 +0100
X-Gm-Features: AclHuK9fhTVlPSoaFVQpmWKFtp3rg-Yo_vESXYaoYYRFIlvR-B2NGlbbcPxrfcY
Message-ID: <CAGudoHF3de_55YvdztPs7QiYs25u6nPEV=uMOzfr=bWmwof69g@mail.gmail.com>
Subject: Re: [linus:master] [fs/pipe] f7f4665dc5: lmbench3.PIPE.bandwidth.MB/sec
 18.5% regression
To: Breno Leitao <leitao@debian.org>
Cc: Christian Brauner <brauner@kernel.org>, kernel test robot <yi1.lai@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 12:11=E2=80=AFPM Breno Leitao <leitao@debian.org> wr=
ote:
>
> On Thu, Nov 05, 2026 at 04:57:33PM +0100, Mateusz Guzik wrote:
> > On Thu, Nov 5, 2026 at 4:28=E2=80=AFPM Breno Leitao <leitao@debian.org>=
 wrote:
> >
> > The test at hand has multiple readers and writers using the same pipe,
> > with 64KB i/os.
> >
> > Prior to the patch each writer had its own private pool to draw from,
> > guaranteeing no allocation will happen under the mutex.
> >
> > With the patch the reader exit also drains the pool.
> >
> > As a result tons of allocation ends up happening under the lock again:
> >
> > -   94.88%    94.88%  bw_pipe          [kernel.kallsyms]     [k]
> > __alloc_frozen_pages_noprof
> >      94.88% __internal_syscall_cancel
> >         entry_SYSCALL_64_after_hwframe
> >         do_syscall_64
> >         ksys_write
> >         vfs_write
> >       - anon_pipe_write
> >          - 47.46% alloc_pages_noprof
> >               alloc_pages_mpol
> >               __alloc_frozen_pages_noprof
> >          - 47.42% anon_pipe_prefill_and_lock
> >               alloc_pages_noprof
> >               alloc_pages_mpol
> >               __alloc_frozen_pages_noprof
>
> Ack, this matches what I found as well. Thanks for investigating it.
>
> Because the preallocated pages are not private to the writer anymore,
> the reader flushes them while the writer waits for room in the pipe,
> and the writer then has to allocate them inside the lock.
>
> This basically loses the wins[0] from commit 212ed884a1aeef ("fs/pipe:
> pre-allocate pages outside pipe->mutex in anon_pipe_write") for this
> specific scenario.
>
> > I don't think multiple high-volume writers vs multiple high
> > volume-readers is a realistic scenario and I would not bother fixing
> > it.
>
> Agree, but I would like to spend some cycles on it.
>
> > However, should someone want to address it, I think the patch should
> > be reverted and the resulting state tweaked. The patch at hand came
> > after the mutex is released -- the kernel prior to any of this would
> > still put_page on the reader side under the lock. This bit would have
> > to get tweaked to recover the loss in that scenario (not to be
> > confused with the loss reported here).
>
> We can revert the patch, but that would bring back the two page pools
> (the on-stack prealloc and tmp_page[]), which is probably worse than
> this regression itself (IIRC it would also lose the gains for smaller
> writes (about 20% for 8-16 KiB writes IIRC ))
>

Like I said above, per my understanding the win is not specific to the
unified pool thing, but merely to the fact that the reader would put
pages *after* releasing the lock. this can be done in either approach.

> That said, these are the items I am planning to spend some time one:
>
> 1) Reclaiming the pooled pages from a shrinker, as suggested in [1]
>

The more I look at this the more the extra memory usage bothers me --
even with shrinker support there is just plain waste until it runs and
it is going to cost elsewhere. If this was "free" performance I would
have no comments.

Makes me wonder if there is any practical win to pursuing it in the first p=
lace.

But here is an idea just to ponder: what if the threads using the pipe
were guaranteed to trim it at some point, even if it remains open and
unused?

Currently there is the notion of task_work, which allows for arbitrary
callbacks to execute on the user<->kernel boundary. As implemented it
is rather expensive (atomics) to use and always flushes the entire
work queue.

But imagine the mechanism got extended such that there is a separate
queue where only current can add stuff (so it is cheap). Getting to
the code could be gated with the same branch which tells the kernel
about task_work, so no extra overhead in syscall handling as long as
you don't have anything queued up.

With this in place pipe code seeing a big buffer could add a callback,
which would do some magic to decide whether to trim the pool and by
what amount. Just for the sake of argument, here is an example: 1/16
chance it will do anything to begin with. if it chooses to do
something, it checks if there is a "trimmer was here" bit. If no, sets
the bit and leaves. If yes, shrinks the pool in half. The pipe write
code would clear the bit, so a pipe with continuous usage would mostly
remain intact and an unused pipe would eventually drain to nothing
(including the currently held 2 pages).

> 2) Trimming the pool gradually on the reader side, instead of cutting it
>    down to two pages in one go. Or not trimming it while a writer is
>    in the waiting room (!?)
>

There is no indicator there is a writer pending, at best you can check
if the lock is contested. This seems like gaming the benchmark to me
though, as a real program who happened to generate data a little later
would suddenly find itself with the pool trimmed.

Granular trimming definitely makes sense, provided shrinker support is
implemented.

> 3) Keeping the writer's preallocated pages private again, while keeping
>    the unified pool (i.e. without bringing tmp_page[] back).
>
> 4) Freeing the pages the reader drops after releasing pipe->mutex,
>    instead of under it, as you suggested. This is independent of the
>    options above.
>
> 5) Longer term: copying the data into the preallocated pages before
>    taking pipe->mutex, so the writer only links them into the pipe
>    under the lock. This doesn't seem trivial, but it would make this
>    whole pre-allocated buffers go away
>

I think this is sounds awfully complicated in face of multiple writers.

> 6) Any other idea?

The SMAP stuff is the primary problem right now. To reiterate: every
single buffer read/write takes a SMAP trip, which is very expensive
even on modern uarchs. Refactoring this into i/o under one SMAP round
would provide a visible speed up. It also happens to not pose a
tradeoff in terms of memory usage and would be my first avenue of
attack if I was working on this.

All that said, one reader vs one writer scenario definitely makes
sense to optimize.

Apart from that, highly parallel i/o on one pipe is imo the wrong
thing to look at in the first place. What is more likely to occur in
the real world is the user having separate processes operating on
distinct pipes, but this was not benchmarked at all. Another case to
look at is one reader vs one writer, but all the tuples have unique
uids.
