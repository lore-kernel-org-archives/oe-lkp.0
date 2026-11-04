Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793758032;
	b=0uQPmX77RDjfCq7aqs5lKEoPGgGKclKDzYLDMjFh0wXGYydxoWGLaMqfW383bP+8xR/5
	 rwD5hDjY6Ph2C93Pp7jqz8PQicqiJgPyed/MoSE3DCRCBCer8F5wmTCklmX9+xgMQeMer
	 8rULHCR+zfxYXzMVj60dd0zTC0+qX8BVzed+CUrqUHMw6YWfnn0pdZt86dj1AT9TdRZ5+
	 M/fV5VgZRxEmwB/BGgNoExnNn+/8sr3SAtK4fTbkg7KmgrOh/591mvhwgBc14v/RKRGX2
	 QovTnj1Q7gFOW4Adro+UUuK4LyKnzJqfWdQjsqd7OcQaBWTqCIcwNSfcAq7IxH5UVDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FAiexPt9F2m0rkGdx3cg9FXpp1bQGTobMFGeTARij3M=;
	b=ZDxKUJngSvlcx7Ud7YA4lW26keY7UB3LtywmjBYt4/xojTAhg+2hg6Cn4mod21AlYMdu
	 IxRqa07U9EzkWWZ41jEI/CYO1lgYVaRF+5PCelIQKr+s4g0W4m1Uhef7u7CuoKgk4LhKu
	 XpGwDaD7jo+bi87O9Yfa4k/S38wc6jiRkTROGSaELerr8h7pbTbK4SJ2eTSvCqKFb0vin
	 Ae3wBPd9OhFR2QhdnFTTU9RSs8fjyeOvfKIilwN/2bq6nDcqKbHtOeMxIeMvDR3q0ibng
	 4KdhedbWOcTDX6568yXPGg90OAZviGko/LPeddgWvg7ByELBCxIiFy7Kn/DkFIs6Idg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G5eqWZrY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F69606A326
	for <oe-lkp@lists.linux.dev>; Wed,  4 Nov 2026 02:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F69606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G5eqWZrY
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-54492d8a988so137021cf.0
        for <oe-lkp@lists.linux.dev>; Tue, 03 Nov 2026 18:07:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793758032; cv=none;
        d=google.com; s=arc-20260327;
        b=PMjG+OjoFWZ0rEFovfpP5gv5UAOHa1mTGRb8LRRkpQED1X9M3emCb2Cq6CoG0//PhJ
         BiytQ981naXEyiTI4+eLADozsDhgbKzWTpXVx19NkV8Wn80tlSrgy0fRiu/uQOZGmxfy
         YPsF9rGiKlhgzzrXrEyDK6frh7ou/YAly30i/Qt8XoT1xhPMCt7Sg1hZsJUIYbFc253Y
         1+Bh4Vz5s/7txbvnXb66youhhps69U40aCabxIOasGipK6Wu8KbT1KhiiW+35s+6h9dK
         NYVwT1c47MJeUD1A22M8OUQnnjIqHidGquDJF0QbwItZJSUJEoVdXbnRi9/UUCVbZ0dX
         hHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FAiexPt9F2m0rkGdx3cg9FXpp1bQGTobMFGeTARij3M=;
        fh=LzF+nDGJrTg3NOWGnE5TdE7/sSyeii2VUdzZYQwx4ps=;
        b=gWhts3fMNDnpA1RwnodE7qiIzr/He7IILwDqZeMrrKs3P3BqklV/k+ohnaaHzn2az4
         /Zz/CAKj7qv9kkDFXiV1DbzA0JKkUhEo1ppcX2hbRFz+dK/o4uCZK1fZLViOCwwIwQM4
         OiKmfvmgY80gwF9Q0t1wkMjEIrSl8Df5BfGScFxxlLlKNl9owM5mbW5LGe29ahFXWy3h
         U67erVIQDjsaf0sBtOexKs3dFwE3BMGTrodqFSI7K7Sk07Hbo+MTdf/XbIHCKVkCl68E
         5AyKVibyt9lhfO4KyY4mNhf3qtjfX5oxmaAgK5/aVwoPIkuSASjcqtLOhjCJgimlaCAg
         yjjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793758032; x=1794362832; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FAiexPt9F2m0rkGdx3cg9FXpp1bQGTobMFGeTARij3M=;
        b=G5eqWZrYjaqZrw0sJ9Hzk9lCcAk+SBBo4IQ10E/cVqxScmEI+TPip38q39v47Sopt1
         APC3cmGzqW3khpZlvzQ162bPdszoFPMsoNNNLB+wvpvX2tT5kSOr9kDXwcS3rc4BK2pf
         xfImvRStZbz9J+22cOrVXtIyIxuL5hn4wljCN6qAvJ9EEztJQR3Ft3pVQtOnv/F7DWuc
         4SzeBUbNU6Ir2A8F/XFandxk6IiYRq1/pD6g/CacxftmEJAP2DiApIaQCavj1e11T1Ec
         LFbe+Uvu2INgq/61BR7z3CK3zJisSnLZ9LkiPrlV9q/NDcLLwrmpufe5LxTOGNxt3OOA
         DC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758032; x=1794362832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAiexPt9F2m0rkGdx3cg9FXpp1bQGTobMFGeTARij3M=;
        b=lmvzPzJOky5DqAbw4kDTZg+aYXZ+sKuezDOkt9YoeKKeQ5bvPYXLuRL8YBS1euJVwx
         S8FYhCBiG9rRRmpj4DpbEW309vvaas2AHBkpkS5Ebu2fh0D38XbtoGnoL97fCKMSobxT
         XCSfXz3J8m5wpWcJpqachXmzpooDT1GsD2QynpZ+kAhLiOlHmCba8Ik2RGWF5b3gJ/Ce
         eO8ppmSsY9/0kNzTc+FK9OsBVZgPE99z7Rx10GMBCTTFa0UR+qoVm8YurvXJ87yzTQGR
         XS1d7ZZZ+GgS22nQcYT4GrIMxa/YM39F5/w2U0lGaH8A9pzAAzAEJySLz9tQg4LAWcVd
         7FOw==
X-Forwarded-Encrypted: i=1; AKwUvBy9ZsZ6xWOYGJjImX+C2QPuLw2pz2OILiLgAQNJvWzfnpTPOJI08zmBG38TP0+sv1G0UfaLGvE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9/NSMBtWYAZ/U2GB0TI5epDwVhOKTGwOGILMn2p9LgNYRmOqHB
	+TfJf8iIN5Wyoec/i97JGOwX75iwHk8oKz/LgJwKq57EBIfMidwsU4oVYHXS4bz1Apr43ECpy7/
	2hDckoMrBu/R3zQKKBt9zsmCNvgUjO6TRIbH3WvBc
X-Gm-Gg: AYBFou1ydscLYqkyRrVJZof77bZ5TLj2kWZlScZXLIbD8HVW1yG7qY9hOL1BHM/C02w
	l4589a7adt5YPzYG4m6iDZ6Rt8oVjY3zV6NUB2z2npVAtfup9HO78qFoPMj4vMM86w7BKBz0pQI
	AsZY8vIpLtLDJJRo0+bu9ECb5eA3GqSS4477ZTVnYNlLlXnnjQoKQjAOmhGKspq1doGePEiXt7t
	8j0SdJ7JZ7vjZI+oLfGQ9Uhfolo/s03PrBOaieqVXyTUvf2dcg8L+Eqqq6IcsaWRPNZ5TcbXAOq
	GxgZbEQc1227mziVym/KlizFegJWfn91qTNAtKvK4bRUxMxw+cYHfKgYhh1tnLzvsq6euO/bWij
	bu8Tm508ZG3nAaXD3fTu5Y40uklGO/bEuq8giVoUcCXCvOLZdERCLX7XhSzGpYH897zSGKhwjhP
	ZrEpcI3xKIxlL9
X-Received: by 2002:a05:622a:4d86:b0:52f:8389:29e0 with SMTP id
 d75a77b69052e-54b227f261bmr9698371cf.0.1793758030925; Tue, 03 Nov 2026
 18:07:10 -0800 (PST)
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
 <20261102080103.6e3f602364747ac6adb13f5c@linux-foundation.org>
 <CAJuCfpGmHWiu0Hmob-PgnvWAMn=CD0-xgiyGztP+P=OFrwwfTw@mail.gmail.com>
 <CAJuCfpGwZqGkOm25=BWAh2QgA8Y00OUmwxsDU+_qOsVsc+KHhg@mail.gmail.com>
 <20261102090125.58a2e80d1669c681c33ed20b@linux-foundation.org> <CAJuCfpGvLt+QDw+n0QnZmBqryMrX+SRZJUTqFhVNR-EXpXBRpg@mail.gmail.com>
In-Reply-To: <CAJuCfpGvLt+QDw+n0QnZmBqryMrX+SRZJUTqFhVNR-EXpXBRpg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 3 Nov 2026 18:06:59 -0800
X-Gm-Features: AclHuK9a3R3Bk8Y8NTBpy7q1LcP4CVXMf0d8lIiveKtvu79UpNEuQo-0lJdArDQ
Message-ID: <CAJuCfpHxk3nAnH7xsqGEtJFDo=ZVWKwWfmck5fSvuLmnrG647Q@mail.gmail.com>
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

On Mon, Nov 2, 2026 at 9:21=E2=80=AFAM Suren Baghdasaryan <surenb@google.co=
m> wrote:
>
> On Mon, Nov 2, 2026 at 9:01=E2=80=AFAM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Mon, 2 Nov 2026 08:15:47 -0800 Suren Baghdasaryan <surenb@google.com=
> wrote:
> >
> > > > Ah, I see now why handling READ_IMPLIES_EXEC is needed. Then your
> > > > complete fix looks fine. Perhaps we should mention this pre-ARMv6 C=
PU
> > > > detail in the changelog of your fix to explain why READ_IMPLIES_EXE=
C
> > > > is important here?
> > >
> > > I guess I have to ask whether you want to post your fix as a followup
> > > to mine or if I should fold them into one patch and post a v3. What's
> > > your preference?
> >
> > yes, please just prepare a v3.  I don't think bot will be offended.
>
> Ok, I'll wait a day for others to take a look and will post v3.
> Thanks!

I posted v3 at https://lore.kernel.org/all/20261104015447.363602-1-surenb@g=
oogle.com/

Pedro, I confirm that page migration will not change Rss even
temporarily because pagetable changes are made under the PTE lock and
smaps walk takes the same lock. It will see either a present PTE or a
migration entry which it also counts in Rss (via
smaps_account(present=3Dfalse)).
