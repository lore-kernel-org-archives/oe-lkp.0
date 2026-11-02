Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793640109;
	b=Ft57WsoJoMGridQW29tRRPbn7IucnlkspqtJo2GE2k1zI6yqeT+iQDCgPhVKNmEWtKAX
	 RTyIMnUurQiL4ccCZFvPyGTKujXh/Wb5DZp4NA1yI6kQGZnUwoAEmsNi2V5Fi8X2JHsDH
	 WsYWOiqVb+FQ1KKkY2mxjgsgxflcTXEfGby749bk5xGJHfWOtkwsleu60LQd5K0/Dk5tl
	 QjywK9HiuaH/jdwJfZiy+IHdPXEGXmvl0eGmKEKWsNoTfSBJYUzznadVqHfcdQObu0uNV
	 2jFzLDf6hJBev5xT9VuW/ATEVHVPrMfYjWCbA9Uwo/abL7AR4bq5AqoBE55ue56Ju5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Pufnyo/dEDOXN1GFROHvouFby0UdETgJWNBykJQU2Hc=;
	b=3FUFRrgAE3vzRDzZrGbbyeTbqQzwDInAdrRGH5jLwh0hHrPoO2+UtfqRvJ0O1hqamzAs
	 M4GG5LrF986jJzOGrhLTijjbIg/T3ewry2RaYeZ6/akTIp6EgTGEy4CkchVtt9QokIs0V
	 oVn6f+FbqXU7WwtffUR1YgTCOquGMuOwqmEtAIY2L2ubQn8xEqFQMIk9Y6ntjmStzK8+5
	 ToOjGOmfpeGavx7Wh8sx2UlXawGmWbuUBPC8xcPkmmIvU5sowDq+m6qYcZj0wMCsJlhMG
	 IkYbhPY3+XVMUjA4WNZKMer1kc6JXa2JAmsP1CGLnZBRmOGHKgFRCDhsv5mThDripKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cqDJaZWz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9C8606BA5E
	for <oe-lkp@lists.linux.dev>; Mon,  2 Nov 2026 17:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B9C8606BA5E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cqDJaZWz
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-533202fe429so567001cf.0
        for <oe-lkp@lists.linux.dev>; Mon, 02 Nov 2026 09:21:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793640108; cv=none;
        d=google.com; s=arc-20260327;
        b=MPiVYK6/0ZGTSxeR7Ea8U2npiqmTletTZIg27pOgMMuvPZ1tPn+SRSGSN5Eg8MGjkU
         r8kZ7bFz4N/dKIDXBcutJuEflPOV56UXQm3OeBaBR7hoMjDXQ5AIgz10Bqf68cj820Fi
         9LO4qvjPkXJ0SvK16PGq5EsybYN0hot8TwWgG1Gk1lS4A+fzJVLvxHmnhpvMdpjOOJSk
         r7rXDIZhbZ7wij0MyB7eALIhkk0fXMJDRVJvktIg6alBWF2q4lRA2tEcvKAtc153oWxQ
         dTgElUEveUTAz4wq3A7YPMeGOVAX+iXLsRLW9Rawq3ENgtCFKcubheOgWxWfKQCzG+u1
         C4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pufnyo/dEDOXN1GFROHvouFby0UdETgJWNBykJQU2Hc=;
        fh=q8G7331AfN6Gtl4QQA0Pd2luyykC6+Q45L1uGMgcYTI=;
        b=E0QJbNpFLipvh0ObmFHirLZOfP3HnpTihbntp6j4UqIaWXqO2joS2AdVaNI3IPz6Yo
         F7noXGvB6toJfkmVw93YHLd+CgXbymWiH7pTr9Haf6qbZsmR83zVCQ5ZILDnXFkWZCMR
         10ax6PGhaQHasI8VUVWcOeUSoXowWlhkobn7PFRx8c1hT2ZBx8P/NLgIhr/Plcdwyqog
         vIjXX9rg/D5TESeqO8SLAr2WknRwXt+u+A5O3pfbPdCRw7IDmY8r0Nko617KZ61TZKUf
         q+DrLHhGPTH9Ia0isM3fk0PTDYPv9th+GyjUXZ2pKf3sDGT3Dl2bB46DXidr6o88FX9a
         /+8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793640108; x=1794244908; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Pufnyo/dEDOXN1GFROHvouFby0UdETgJWNBykJQU2Hc=;
        b=cqDJaZWzeiPYwkGmH3jhARLJd0Yy5YZHJY0qLNh+m65qJRIgWn+2wlFOAPUc9w4b5J
         jpXr+o0XfA5U7S3HvV4hKqWG9Qht3BOz+AMaTMbhrl3p4NEbHnq+zlE3P8eBKrysph7s
         ywHuOJtPoMibmH1iR2HBPTHOu30T3ATzdMLhjqs8bt8RRdqm0UmrVVyS/9/94bYzVpzC
         eRL8+9I1+a7IETLm58WH4rXnadmAjZnozg/0dMeqqTSb3N2RidGofINEEeXRc/zgI2Jw
         0J5NwZtPZEmLh2vwdXdyUCt9w+kLNnvT0UoVl8uLCtaN73CRhwi2TrUKbgQHbc8iiV5a
         DxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640108; x=1794244908;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pufnyo/dEDOXN1GFROHvouFby0UdETgJWNBykJQU2Hc=;
        b=g9JSNkqZgnrB1gCjXH0zPaMXRN+TpcjvFiTi6q/OgENbcajQkQKxDGWZD5WxIFsrAU
         DeEVq9BK8A5GCVkWJCnPgYCgL1j+/RaucoChVHHJaZqdC4qxz2SmRivt+U8TRUoDQyUQ
         xM0nGEFFZ4p1XxU6gwd93ZvwVAEW/QWWcublga7bbL/8K6sYA2EBzUbZDrnEfQcQmuOs
         brTCjDxgJ/bZHOknn1WJTaQXJ6KLSHvFfPDkFnmruHXCtUipj0dhMZGCiOudrovMv+Bw
         5Uvs/UtinippB5x8dDddHkLu+PFv/IVOnOzXLm+UnC12cBpEKmCOrzFRlvuUJPBeIB0j
         sKrw==
X-Forwarded-Encrypted: i=1; AKwUvBw8RVhalpAULEfKPzMvUs/IwJsDI6GeuuviXPTl4fEnSnPUucS9IS0Eisj8RFOLmNJrRSD5JSU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8VrjDFSs7IWpZEl39jcBtrl0+Bq0pUUPSq14OJeLMlHs6vn2c+
	PmLq5fPPZ1HNO3Z6VOYen3m3klxUlzcwyxzxPSUAHaXnM1OgFOkgRPv6FGP2DYMiA+ptqdaGlmF
	NDRwRNC3nExfbzDL8mFW5JD9BDw1nk33Ffw8G7QvJ
X-Gm-Gg: AYBFou0T15CH4Y6mmPiRy7Yruy0OasnJoGyVp0XmngfzgE8MCuqFGQYGxWkWddXsS+v
	iyT+SPtRkS+Ka4qnqkYOKEMz8DbOKVhOaG7Zu28WfvvsxHjq/aG0NFa1DIEY0uvGNsoyz/iUj0G
	2wz1UBvj1Tmk1OpiCbHAejB+NdbThRPxtSiHQuwNQwj/WrzCvxhWIEb+oGnGFfnCwIItblulR+9
	hDkQc0fqH/t2blwMQO1q0Cw+lQ29oiyGETLsloxo507cS2aWmBjA39J1KhyH2WPO5cn58h6XfFG
	3Zx6RbFFQYt9cxVJze9JnpTrpQjUOWuqqaOEBitERZLoBCNAXrY1HLXFvAu1GuvnEpPNAamOqTb
	LqvC1Ul2rAvbQzkOVCY6p0BmRg8hdOUaYdNi7
X-Received: by 2002:a05:622a:c01:b0:536:78de:775f with SMTP id
 d75a77b69052e-5414eed1434mr90915071cf.15.1793640107803; Mon, 02 Nov 2026
 09:21:47 -0800 (PST)
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
 <CAJuCfpGwZqGkOm25=BWAh2QgA8Y00OUmwxsDU+_qOsVsc+KHhg@mail.gmail.com> <20261102090125.58a2e80d1669c681c33ed20b@linux-foundation.org>
In-Reply-To: <20261102090125.58a2e80d1669c681c33ed20b@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Nov 2026 09:21:35 -0800
X-Gm-Features: AclHuK-DjqV142Ud10paqFStz21PGZUYRyNelFGZhjzHwoB2M_64kIh8h-R_AJQ
Message-ID: <CAJuCfpGvLt+QDw+n0QnZmBqryMrX+SRZJUTqFhVNR-EXpXBRpg@mail.gmail.com>
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

On Mon, Nov 2, 2026 at 9:01=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Mon, 2 Nov 2026 08:15:47 -0800 Suren Baghdasaryan <surenb@google.com> =
wrote:
>
> > > Ah, I see now why handling READ_IMPLIES_EXEC is needed. Then your
> > > complete fix looks fine. Perhaps we should mention this pre-ARMv6 CPU
> > > detail in the changelog of your fix to explain why READ_IMPLIES_EXEC
> > > is important here?
> >
> > I guess I have to ask whether you want to post your fix as a followup
> > to mine or if I should fold them into one patch and post a v3. What's
> > your preference?
>
> yes, please just prepare a v3.  I don't think bot will be offended.

Ok, I'll wait a day for others to take a look and will post v3.
Thanks!
