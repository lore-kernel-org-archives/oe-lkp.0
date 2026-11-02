Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793633499;
	b=lR9olinAaMvScHJ36kG3+WcKJwgFT0VEc48V5W8zX/+11qS2Odt6juuJXAOvXT6cTxfM
	 xJrqn5lq+YPph1lhWuYOyxGIuzyKh55F604oqA39oQADom98A7BqEPKSorH0cXE/YIH0G
	 DzyTx2hEgZT23C2uknrlnbFfte/1OPDd16jcvP4pyJeHR+yZtx/z9G4+3t2/3vfeKsC6Q
	 sYp0HJBec7mqPTgsEIyly3D0RI5TMZ6wc1c3NyVi321f7DpqqhyWB4++1fiThtTR2gLrf
	 65TAz8hYaZmI10GP4Qevlm26vfI54aEZv+ZeEhw88EdlLpOxjsoBuPMIECC0KLVjX4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TeCP4ZpYTq9SpZp3YEhJ5WlDwv4/mZ+EDEcMFOS7pT8=;
	b=rI1bQSbSHsi6k1+RmWN5/eAQjxfH6M/ZGycCyuup8XqmckTPJX1iv1iYPepEffX/EudK
	 xGHSabCJq1yQjQXf+rIDre5sy/QOwJMqqiBr6HYzK3mWdEA+u+Y7aRrBQ9N1eF4mC2ffx
	 dQ+2KI9xXIdVVoDmdwi1Hx+TQO7UWiiGEhtJqd+A3fEdSTGqwqcpQzV5V08Jg96cK5HC+
	 y4Uz6+n872FxIbSfpEsyvbpvQO96mqM82a3rmYisgLeciHhjR1MPy94ZM5ZM+EFgRZDf2
	 e/IalA/g9YJFu987dDHoosGO/qHHFvk0K37MaGE+gxRThcoHE2jncTJULiOJX8LeL5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K4WNTKQZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F622607229C
	for <oe-lkp@lists.linux.dev>; Mon,  2 Nov 2026 15:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F622607229C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K4WNTKQZ
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-533202fe429so515901cf.0
        for <oe-lkp@lists.linux.dev>; Mon, 02 Nov 2026 07:31:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793633498; cv=none;
        d=google.com; s=arc-20260327;
        b=Tmg+CuJjYB3j6yuuJyn/R6C6Z+Au/8bTYML78PTgaNPTodOSkBWhmvozx+XzUyGRQC
         6oJ1NbR8OmfVhx1qB6pLNHVmomPG9+Z+Q0m1GGhFRG+IwFtEe9U2Asl6lrQjGBvC3nGX
         UL72E6brXpze7vvc1rdSVlGSpno5/n+WUrRTDYKZGjIxPcCUGC95ENON4zobBEz7fPn7
         /hS+RXoKg2L0N0YB91BffECfy9Vo02L2y05mCjfaOq+FkYkv/MDpWr24a47zyzHfWqR1
         Tpo6iZm5jK28aKVL6jPC+/KSVBmXBoVQ/tk5+Xg6i4LRj79dwFvyrcaWmGR19fcZRxEy
         /3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TeCP4ZpYTq9SpZp3YEhJ5WlDwv4/mZ+EDEcMFOS7pT8=;
        fh=RgqEjV1Mh5gIbbtFXCpoh5YQ6JKXnEmCF2omYKS69cU=;
        b=Y2QoVYgrRv7QpdyWglaXfUSXCYmJcpeWfSMQ++kVdxzU+XZPDsP0Cp7mPk7wmACTGU
         OgD2q3Ti3uU3RmAkguI2DIc181kkVllSag+Dapwd4GCvZiLwyEKesvTj0Xl1go3piVs0
         xKQQt4lHlVn8WWDw0RYwVzD2laAH6n74H79M7pCpd4JlSIWNKriNgEuiw+ocFRmiYvx7
         KKomBltcU0s8tI4pcphsu9pizVdvchFPKnQM2eKNByllAs1lr17Iq8sU4HCUqU+qY0U3
         5xyMX2l8TDMSs7zUQD4NsmuVElH0BXX3vruMNF0Zdnjxm2U5la9RY1vNZ/LT6W2GxEvB
         jCHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633498; x=1794238298; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TeCP4ZpYTq9SpZp3YEhJ5WlDwv4/mZ+EDEcMFOS7pT8=;
        b=K4WNTKQZl6NX86g8iGhFf0f3k/xeY5UN18k75rFJC+sFyeeLh4dyNJFQNg3a/QpIqj
         cVAgyUQbc6HY7Qf1n5VsjZbcQsm95yXbOFDTViNsTPO+7oWyF3kao/QCIVCLMjmaR+YK
         K3qaFHPpfsa6w607S19u2I7DNlVLxh0o+2ArsK0XcSKd11J8X39x2oDumbUtWI2vxUBZ
         gZHWJ4hIARRe70ix2LruPSQT8ZrcmUlDk0D84tFgB48J+/UGs5p05vf5+d+0ym56NUMw
         3pRjToZimP2UKhKqCQ/r0KwxKmrtolbJE/LvWb//6dIZGkRrsLZnyPEIgNBsxOEFp20M
         ytAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633498; x=1794238298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TeCP4ZpYTq9SpZp3YEhJ5WlDwv4/mZ+EDEcMFOS7pT8=;
        b=1/JsaGqQo2SVBwVkZEx7DRVx2LMTrn0Q3F476yl4kpbPHuho2DgMLrIn0l2/ZSpV+6
         4/F4Sac9+zLimRH/1og2allNovsly43oZYhX29zY84DzXssu11TLp64UGWOuR8G/Tjlz
         VvZ/j21AxzZiIUhyfgTgTpUN83qKlYQE4gbLLvFpqd+gCUYFUIfsLD/pqTGxK03dVYgf
         QMrdv0+YDOxAIFcnMjoTZDEFs6UChU49uphz6qvy53TDDFerJ0/aP37srgQsZg1ZVkkg
         4fKjkF4DqRAnQS+FVXF98Ar73gce+/bnEe+jyfaDoHW1EKlUz6dLeqPL2OTxrAcYFW9X
         Yudg==
X-Forwarded-Encrypted: i=1; AKwUvBye/4rO5HDLjP1ZLnqbZjYtZXvcPNVpJN039bDU1s41RzzSPUN8CtQ0lRLe0kzjb+CLDSq13Rw=@lists.linux.dev
X-Gm-Message-State: APuU4Z9m2LQSbnh4WMyMyV3dqvsrK6jDd+LYPontEL99+VIYtUN57jXj
	lgi6v0eW7nC7HZPgHP4XnqaHtAI9SCu0/57WSqzoJ0UiwVNM4oowGf/HhZz+1OVQhxqocq5rP6S
	0uIQ7bQXYAR1SUf/MBB7ap4Vpv7HskoQsECe9f7x2
X-Gm-Gg: AYBFou1ZKvTWWlnpJyb/jxR1pN4TMFJEzIHCmgW6Q2tmW9vPPLqQMy+6/Egh0XfMnOC
	Ui4yRjsIlqRHOdj2j3rD1Ot6e1IqSa3PQDhfPG2Gi/IZrnO3hQeUMmePpYWSu5vTbVd6yU0U6j9
	I3hqOeUfGWMBfc5+f23Omzp9e9koMxw7F84BglOYdWpMxeRZhzm6bTp2vaWrBMnfwIashRHSSey
	pLwOFvzk5isbx2VVjvmLyOR9PPx9b5hEC3bYad0mxMUWaDQqEe2CLunTpAW5vcynVu+O3GtgfcH
	bc5In9Wxxzj8IgSJ1hc8RwnWfPhx+VLb3aGjCdnPLR6VnkWVFTVyyWQ39kDwy4ZuDkib2cfTfZE
	2YQhmTbsyCrJGBBL2cgY8H8wnJT5h2y5sgKBHPMmz2wLhsqLUpYkjAH3j
X-Received: by 2002:a05:622a:4886:b0:530:e00f:7768 with SMTP id
 d75a77b69052e-54125fa7a8dmr88444051cf.0.1793633497692; Mon, 02 Nov 2026
 07:31:37 -0800 (PST)
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
 <auiKq8zbQTMyY2tG@pedro-suse.tail5790ac.ts.net>
In-Reply-To: <auiKq8zbQTMyY2tG@pedro-suse.tail5790ac.ts.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Nov 2026 07:31:24 -0800
X-Gm-Features: AclHuK9TnI7YVwGqKzYt9UR1HPgu0Gc7xrmAN4U7UIU0R4mvvXL1rE30jKEZSis
Message-ID: <CAJuCfpEcpYxEcje_f17bZ08ngMsDxtDUqNr9p5W+V_PRWOE6-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, ljs@kernel.org, 
	jannh@google.com, liam@infradead.org, willy@infradead.org, paulmck@kernel.org, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 5:08=E2=80=AFAM Pedro Falcato <pfalcato@suse.de> wro=
te:
>
> On Sun, Nov 01, 2026 at 11:01:00AM -0800, Andrew Morton wrote:
> > On Sun,  1 Nov 2026 07:45:03 -0800 Suren Baghdasaryan <surenb@google.co=
m> wrote:
> >
> > > Pss metrics can be affected by map count even if VMA tree stays uncha=
nged,
> > > therefore tests checking VMA tree integrity can't use them. Use Rss i=
nstead
> > > and pre-populate the VMAs so that Rss changes if a VMA gets skipped o=
r
> > > double-counted.
> > >
> > > To ensure all test VMAs are populated with anonymous pages, remain
> > > mergeable across VMA operations, and do not have their Rss changed by
> > > memory reclaim:
> > > - Toggle PROT_EXEC instead of PROT_WRITE between adjacent test VMAs s=
o
> > >   all test VMAs remain writable and MAP_POPULATE faults in anonymous =
pages
> > >   (rather than the shared zero page, which is not accounted in Rss).
> > > - Use mprotect() instead of mmap(..., MAP_FIXED) in split_vma() and
> > >   merge_vma() so the first page of the split VMA stays resident.
> > >   mprotect(..., PROT_NONE) splits the VMA without unmapping the first=
 page
> > >   (pte_present() remains true for PAGE_NONE PTEs), and
> > >   mprotect(..., self->mod_info->prot) merges it back. Both parts of t=
he
> > >   split VMA retain their non-zero Rss.
> > > - Lock all present pages in the child with mlockall(MCL_CURRENT |
> > >   MCL_FUTURE | MCL_ONFAULT) so memory pressure cannot reclaim pages a=
nd
> > >   alter Rss during the test.
> > > - In remap_vma(), unlock next_addr before mremap(..., MREMAP_DONTUNMA=
P)
> > >   so next_addr is not split, use mmap(..., MAP_FIXED) in patch_vma() =
to
> > >   merge the middle VMA back into addr, and exclude smaps_rollup tests
> > >   from test_maps_tearing_from_remap since remapping moves and unmaps =
the
> > >   page from next_addr.
> >
> > Thanks.  This is proving tricky.
> >
> > My evolving reviewbot still isn't happy:
> >
> > : This fixes the v1 RSS issues, but two things remain.
> > :
> > : Alternating PROT_EXEC breaks with READ_IMPLIES_EXEC: both mappings
>
> This is nonsense btw. Not sure we'll ever support random personality()
> flags being set on selftests.

Yeah, handling different personality() cases on a selftest sounds like
a stretch. Is this case realistic and do we need to handle it?

>
> --
> Pedro
