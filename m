Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793636163;
	b=qfBHkUia6XdFluQ96msBWJ1EKraD/I5qItqrsnlyz3WzOM0+qVNoUKxv7SU8oM9svFcY
	 JpudbGxwzO9BC9mcir1n7SmSpktR68usmQEKKf0cT2/MRtUpTNv5C6PxRbcQCLoy6TVkp
	 aWQg778618j0CF8wCy4uqIsVerE3lwmvaH2Vb/IqfjeKoIw61d/tsPp3vNsdzbETJHZXY
	 QSTXeKNnNiGqdH69UAq3uT8yw3HFo918U3JHqFyOjo3WXAL8kPp7COruA4WjcVzvJhRoz
	 tS+egtPaI+E+hc2/zP1WzJj7P+rqnKrC1QApUSE7vU/vghxFLQ8KjmQjIfRjYhqDgzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kxbnR7/KEJxYoo6n9ONzf9qbMiZRUpL+64Guv8cNOl4=;
	b=tQHYzT0IfgJ8ROXOrbmXnnAVvG0GiNqzQ8IwhgOz1KvYktkA/15pc4WTzuzM15Lm5hrN
	 OBwU2NqWTucATuUfo4Gx2dBeXu1gM8do6WBVnK12m0qKTDTEWQQg2sJRobmwK15qcntr4
	 EVd+dH5efLdWd+BXEb6mvieK4+WfmtnUQ8Ung5wA5fKKoXgDVhxMdytdQw7fa24zqloeC
	 Y4VKeKv3t2sNwgkBz6JTSgNqnRKjDrbBPCcOFBQFqW77C4+HFgO5TjPW0ZdLCMFP7TnTH
	 Xl+qz/yaRCXFj8b9av6fmcKuVB9iAm1w7UHfi8SH0khwjddUKUJsssQoS282+5KukyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N0JPZ1cb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB436082BC2
	for <oe-lkp@lists.linux.dev>; Mon,  2 Nov 2026 16:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB436082BC2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N0JPZ1cb
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5383c97c8cfso448911cf.1
        for <oe-lkp@lists.linux.dev>; Mon, 02 Nov 2026 08:16:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793636162; cv=none;
        d=google.com; s=arc-20260327;
        b=WsNkzhNABpE1U9hUezU287h8ZJnUVfdptW9SOpko+3XxQ9Y3Aj18HZZXzJ6WR8Fubt
         MtwR79biA1zeuXK3z9I+Qi1QwtnlRJIoe9OfJqLMYoPCeqGe/mz6c91gD5EURSPX9qP5
         1Q74VoCF+AZKQneqKzXKNMTHfhEWP7W/UkQwog55DG6hADOgYGRfzVAwTGlE7M+X45no
         b/KM2qHhUvCANzj0EvbkgX60K3X7ZKMtONmmRlm/tXSI48vnXc6k/G5iE0R1RTfjVo/+
         S7KFc44tpZfUYdTMnWnyJ/IwFzOeUXD8eXC2NAE+e/WSZXqwYWC3KX+GlK5Ay9ghTHKr
         amTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kxbnR7/KEJxYoo6n9ONzf9qbMiZRUpL+64Guv8cNOl4=;
        fh=SJVgr/u/kXQyYJF267di5scHwx/aLGvKv1xQIgV8q64=;
        b=WQCtKkwfKrO1WtVR1gsmOhqyIP3PIu+jclOwwLSEMZ/DygTxl2Phog7c0IoiADUYWv
         nwn03B5TBmsIRFAN6CKAbwx+DgcBe5KTdSJ81sytricR1YilCtULr2aXv8Uh0i8YTxTh
         7Da6P2rLiYKA2X3r0IoSZQ8rAQDB5yCfZM0mLn1XbkNod3FGwtGAALvT+RlamZGggNPf
         CFrMyarvlH1dsEN1RFfkIojgAFCScm2a4wTEj+Kods1cyfBAJAZpuE9rUZKCCc9dsHx6
         QdjKgKiYfFhiFQv9zWB4pz6Jvz1MRMM8F8XtGipCXW2L9beplvTWC6qnEPGTLWGUPqod
         o7Iw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793636162; x=1794240962; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kxbnR7/KEJxYoo6n9ONzf9qbMiZRUpL+64Guv8cNOl4=;
        b=N0JPZ1cb1NwiQ1YUzqz2RPheeECTorJoBW8Oz9XqF963+olbizXQXvJLeP1vGbHbeK
         V0TctH9/b0CExUTMKHiS4EtO4w1fKDVuhhWtlkrS11rxF8xKgUhr24VtpCku0bBC9lq8
         uVy8znecekpjpgKLDL4beWFKo0I5u9kUCR0MDm7jhljiv/lSXqKtYJAytwUUYJfSoEhS
         j4RkcnWJo8gxC2P7IrMBFaruysDOkcZRN8Im96WJq+lAmL01Yv5nNEqySWizNFG9ZChl
         5NxVME3K2G/kxLrvCr6mFwwT9gmWWz780laVF9CR3THf10rVACUVeJF6ViNrTC91RBgn
         6FZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636162; x=1794240962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxbnR7/KEJxYoo6n9ONzf9qbMiZRUpL+64Guv8cNOl4=;
        b=Xh/EW/Nhkh02i6L63eqA69C9T+rswl0E2m2o47Au0fwn+gL/JO1kMkILL1OpQcBLPM
         xrY/6AwWXCI+LPFPfen6v+gfZx0ZnG28hIGenki5ZBLKloCB/hJ8IrqZ0MXnd46ClPGP
         VliGZGij6aXbxOnGiVxNoF2o34Nbe5E/Web7k2ItaJwLAdnvyOB3ETXV3XKjFkVVD/QQ
         UVuH48tV7xk/rYi6KGksCvwG/4GJBbWRBvDxQKAMAKcWpFBJ5qZgDtgsov4JQBrj1xJs
         ynGXh0rgj9VEkyWeFSfQrgv43I+dmm8B4T/w/299cRZhm1gXR+h3IJEkctwv/vciedDL
         kIFA==
X-Forwarded-Encrypted: i=1; AKwUvBwFsBBtzNCBXLNljPZAXBBYi6bj/pP1qn6b0+9ucP57xw7+oEMOqLJJfj53gJ9Wd/hx7OUlhMo=@lists.linux.dev
X-Gm-Message-State: APuU4Z86pg4C+x5jSMnVRjFIlEWaQlCQaD381TLDJw3K9iNFFLyEx3KJ
	5OMXKzAJqz+5P8fKLLu4G/lx2P9MC649jPT+hQo5fAzlWsNIXzkTvaU8Ebp/a5UKghORm8+cQb5
	jqZJlDc0lHfSBxKO89iwEfw2p+2OJpyRkogTWP9bv
X-Gm-Gg: AYBFou30wZ6Pq+6Z70cIxW4BZ0gMCR/4G0sWKr7jsaiu3Zm7QiNQtm+LGxM116zCmbb
	mRmvMqg6A52zjJawwWNBdLFAsvc9ORUDO+4Z9CBHHJyMxRYe0lqN9YJG7RtW831pOoJwh2RdKmy
	rmutO2DbzbNoT8Pgv7HhohKn9DzIYKd+7FC0IpXLNCeNi9tyGSEFHrA5QdS4/bRYJYcFpp8DntF
	P1iW5W3VvX0u4a7nzV0QOo2xIo0hDzMSOnIZ3nlkH6ByySIve3JMFkrqNizbVL4ktndoMM/vx/e
	iRVMC2tmhk+E0pMb2bhpW5qyqAtKE2nhCvnzV1dITdp9Yn91SL5rxTbFE5g5YhlkvB/riGEK5SX
	M7MPwCSOINsvsHa6vrkFzb8+Bxvh/dhsZWjw=
X-Received: by 2002:a05:622a:618b:b0:535:ce3:ee07 with SMTP id
 d75a77b69052e-5414efce383mr93070751cf.13.1793636161515; Mon, 02 Nov 2026
 08:16:01 -0800 (PST)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101154503.3203036-1-surenb@google.com> <20261101110100.90796bf33ef50307a7698dca@linux-foundation.org>
 <CAJuCfpGmPLBRhHa_dmyP10QzyRyvcWMYDLU0+J9t-RCLBsTaWA@mail.gmail.com>
 <20261102080103.6e3f602364747ac6adb13f5c@linux-foundation.org> <CAJuCfpGmHWiu0Hmob-PgnvWAMn=CD0-xgiyGztP+P=OFrwwfTw@mail.gmail.com>
In-Reply-To: <CAJuCfpGmHWiu0Hmob-PgnvWAMn=CD0-xgiyGztP+P=OFrwwfTw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Nov 2026 08:15:47 -0800
X-Gm-Features: AclHuK8MuiAKeGSAs36EP5lVhajY6U8SuusW-kgtsEu3w40nJ0gV00M_UO0Qj8E
Message-ID: <CAJuCfpGwZqGkOm25=BWAh2QgA8Y00OUmwxsDU+_qOsVsc+KHhg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, jannh@google.com, liam@infradead.org, 
	willy@infradead.org, paulmck@kernel.org, pfalcato@suse.de, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:11=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Mon, Nov 2, 2026 at 8:01=E2=80=AFAM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Mon, 2 Nov 2026 07:43:17 -0800 Suren Baghdasaryan <surenb@google.com=
> wrote:
> >
> > > > :
> > > > : The patched userspace test passed all six cases on an existing
> > > > : x86-64 6.18.57 kernel, with a PID-namespace adjustment. That kern=
el
> > > > : predates ca5480fb53fa, so this checks selftest behavior, not the
> > > > : intended kernel's procfs changes. Separate syscall tests on that
> > > > : kernel confirmed the EXEC-merging and memlock failure cases.
> > >
> > > I'm guessing your bot was using personality() to make the tests fail.
> > > Again, I'm not sure we should handle such use case. Should we?
> >
> >
> > : The concern is pre-ARMv6 CPUs, where READ_IMPLIES_EXEC is set by
> > : default. Nobody needs to call personality() to encounter this there.
> > :
> > : We already addressed this in 0685630fdccb ("selftests/proc: make
> > : proc-maps-race work with READ_IMPLIES_EXEC"):
> > :
> > : https://lore.kernel.org/r/20260808200312.6326-1-kmehltretter@gmail.co=
m
> > :
> > : That fixed split_vma(). Alternating PROT_EXEC in setup introduces the
> > : same assumption elsewhere: RW and RWX both become RWX, allowing adjac=
ent
> > : mappings to merge. The parent then cannot find the expected three-pag=
e
> > : VMAs and the test fails during setup, before testing procfs tearing.
> > :
> > : Yes, the focused x86-64 check explicitly enabled READ_IMPLIES_EXEC to
> > : exercise this behavior. It wasn't tested on old ARM hardware. But I
> > : think we should preserve the existing support for those machines.
> > : Populating writable, then removing write permission from alternate
> > : mappings, preserves both RSS and the required VMA boundaries.
>
> Ah, I see now why handling READ_IMPLIES_EXEC is needed. Then your
> complete fix looks fine. Perhaps we should mention this pre-ARMv6 CPU
> detail in the changelog of your fix to explain why READ_IMPLIES_EXEC
> is important here?

I guess I have to ask whether you want to post your fix as a followup
to mine or if I should fold them into one patch and post a v3. What's
your preference?

>
>
> >
