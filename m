Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C271626
	for <oe-lkp@lists.linux.dev>; Wed,  7 Dec 2022 05:54:37 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id s186so19478578oia.5
        for <oe-lkp@lists.linux.dev>; Tue, 06 Dec 2022 21:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WBYgV1mZFl4MlIUpWq//PTUJy0AvbU34Ve81xSxprtQ=;
        b=jrMcMWNXmDtoPJaOjBj5Nd7lpZZsSVWGDFC1bkW4DdQtU/HsR3lje24Pn3vTXZxk8W
         KEl4VjGaT/Ihy4rgyPWGoR1rdQ5CQW+uoaoM/6kK91989SsKLKfWyRKOfHZnwa+k/BO/
         wP5CPVtIdafh9JvV8ugNuYlaoEmenSWftJvqq2wZ2eF/XTdwBnCtx6MIPmlXysUUOi5g
         9RXcjytVNPz1Ztb6P4nCoKVQpKpAxqO9IaND46q2mrPhxrdkOF9zXo28inihqtG0A94P
         lI8/h5wWZ1RsLKY3I6z7RfJlA+gCva9ODcIfHc3s/rdl/FVs28snheDaFTpIuq7QMRSa
         N0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBYgV1mZFl4MlIUpWq//PTUJy0AvbU34Ve81xSxprtQ=;
        b=HcrGe4cFSy5k9ngS9P4chIwoJ1nSt3D/DnNBMPaCU0654F+UN8zoq4QWsKe7nvuue6
         65XUwaqMSmn6VhvrRkOZSdRP7M1otyMPP8TbGqQkPHybTb8Nl+YEZwXPijt/NB2T6Y2U
         UAMIiIHRd4uARfWrlEccRJsX+h/ksR1RJMjufHZumV2hcgppyYF8wPK16INDAp+oADQE
         JH10wLULOSTt3ah2+Nm2e4ylTM3J3yT87ULdWmVXffykey4Dns2JSAPPRhoEJ+3C1pDo
         K0PXmLRYAjbderRuTfoPoFk8qqjiigFKgVVCkuU8VFhu1Zc1HTsPKoxHVh6M972l1TP0
         yQfA==
X-Gm-Message-State: ANoB5pl66aw3RjDXM4pPqsfJUtCWYSFPNYm/BG4+oToIduhX0X0vrPsT
	qbnxbgbkQJLBeVtdzV2n9t7GAA==
X-Google-Smtp-Source: AA0mqf7L8b2MBbL62F/T16YRGt5DKfU0aM6bsDE5BREKFfDVa2s9WMxzIVQlQt4nDeCne0xVzxmY7g==
X-Received: by 2002:a05:6808:1ab4:b0:35a:6f68:5fdd with SMTP id bm52-20020a0568081ab400b0035a6f685fddmr33494042oib.91.1670392476227;
        Tue, 06 Dec 2022 21:54:36 -0800 (PST)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id fo12-20020a0568709a0c00b001431bf4e5a0sm11837268oab.38.2022.12.06.21.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 21:54:35 -0800 (PST)
Date: Tue, 6 Dec 2022 21:54:27 -0800 (PST)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: "Huang, Ying" <ying.huang@intel.com>
cc: Linus Torvalds <torvalds@linux-foundation.org>, 
    kernel test robot <yujie.liu@intel.com>, oe-lkp@lists.linux.dev, 
    lkp@intel.com, Andrew Morton <akpm@linux-foundation.org>, 
    Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>, 
    Nadav Amit <nadav.amit@gmail.com>, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    linux-arch@vger.kernel.org, feng.tang@intel.com, 
    zhengjun.xing@linux.intel.com, fengwei.yin@intel.com
Subject: Re: [linux-next:master] [mm] 5df397dec7: will-it-scale.per_thread_ops
 -53.3% regression
In-Reply-To: <878rjj22mz.fsf@yhuang6-desk2.ccr.corp.intel.com>
Message-ID: <75d9bc6-f43f-5169-29af-b3cd5653a77d@google.com>
References: <202212051534.852804af-yujie.liu@intel.com> <CAHk-=wg330wAAxwSaJBPUtL5Rrn7PoQK3ksJw2OLvBxA0NGg+g@mail.gmail.com> <87ilipffws.fsf@yhuang6-desk2.ccr.corp.intel.com> <CAHk-=wjDzVL+r6NmnU--tyEfDYhUB-5m=PQBZTQ2Es8bx7Mz+w@mail.gmail.com>
 <CAHk-=whjis-wTZKH20xoBW3=1qyygYoxJORxXx8ZpJbc6KtROw@mail.gmail.com> <878rjj22mz.fsf@yhuang6-desk2.ccr.corp.intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463760895-1086260698-1670392475=:5515"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463760895-1086260698-1670392475=:5515
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 7 Dec 2022, Huang, Ying wrote:
> Linus Torvalds <torvalds@linux-foundation.org> writes:
> >
> > Does this fix the regression?
>=20
> I have tested the patch, it does fix the regression, the test result is
> as follows,
>=20
> 5df397dec7c4c08c 7cc8f9c7146a5c2dad6e71653c4 7763ba2bb16804313aa52bc78ae=
=20
> ---------------- --------------------------- ---------------------------=
=20
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \ =
=20
>    2256919 =C2=B1  5%    +114.2%    4833919 =C2=B1  2%    +116.6%    4889=
199        will-it-scale.16.threads
>       8.17 =C2=B1  6%      -8.2        0.00            -8.2        0.00  =
      perf-profile.calltrace.cycles-pp.native_flush_tlb_one_user.flush_tlb_=
func.__flush_smp_call_function_queue.__sysvec_call_function.sysvec_call_fun=
ction
>=20
> Where 5df397dec7c4c08c is first bad commit, 7cc8f9c7146a5c2dad6e71653c4
> is its parent commit, and 7763ba2bb16804313aa52bc78ae is the fix
> commit.  The benchmark score recovered and CPU cycles for tlb flushing
> recovered too.

I didn't study the patch.diff at all, but slipped it into my testing of
Johannes's no-lock_page_memcg-in-rmap: no ill effect seen in 9 hours load.

Hugh
---1463760895-1086260698-1670392475=:5515--
