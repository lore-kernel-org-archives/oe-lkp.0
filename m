Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB612F3A
	for <oe-lkp@lists.linux.dev>; Mon, 27 Feb 2023 16:50:19 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-536c02eea4dso193470597b3.4
        for <oe-lkp@lists.linux.dev>; Mon, 27 Feb 2023 08:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZeTsz2LgmEqTFu2D1y6H+6n8BeVxT4dDCxIvwbJYZY=;
        b=jMbv2r0SjzyLfd/109qTg+Zt8ATsSAGsZlaSIpfCNwq5MIkuMOmLkPrv5s0SX2Niqc
         MW13m5uCGpMy+WActWyp/aBFjIsABYD7rOJZxYz+L8ev/at3VpEsOl1aSGD/fg9fAxua
         eJ06FHs9y2Gd2u2RJdup1zDKoxef+VlmA1id7W+V1aNeMurRTMCoKUeuxbOl/2FJMH+K
         69ocsLyGP1GZMP839JOIlS0Gn2tFsDBARF/ntfFuAjaNjJAF8gfgd+ru+qMGlRREUcd8
         PoQCRdH5cvAnSFFw/+0AoDeKZqRUsNif+iN7CSIiwJgxom+C+kB7bPml9a7g3HDM5xhG
         H+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZeTsz2LgmEqTFu2D1y6H+6n8BeVxT4dDCxIvwbJYZY=;
        b=2L/PokmWesSu2ZdlIhfEOVOjYL4SG6KVvhJY7R5LxmJi7EmUZQcVFZ1YuhJFqpuGhQ
         qrTRcQwDr0g+dgMbrJPIegGpF4gg+/HfvlevlK2X9xUuOMdGbSZVUZJ+c5T8Zu4AXa5p
         ft8deD14Pn6EvFlO6qgxK/a79us2nAqqCfySi7Z2CSD/A24MsgZ89PK6t8tdUlnMgVO2
         5WYaesiSkOF7G2oK7V4ldo8LSYAChrEOoNoJNKPgmBWRAnKGx1DzRZbH3jpDnXxZbdVn
         2UuxDZxXKLO4O3tIWNDr1UNGcTox2jSGJyncSXOtRJXDujJE44JrHdPdKaHV6YED/ETJ
         nH4Q==
X-Gm-Message-State: AO0yUKWQMUXE95nIG+zXP/IRDkvW7k1Za8XwBRhffY5pO2yJgB7kFBG8
	Hp0rApznLV2iNpjNjQeDbSiwvK8be+yPnjVYmdDrXg==
X-Google-Smtp-Source: AK7set8lTXaiez4ACEuOb2wNkB4Dm/JTTL0C1kWWQrm108DPBrKq3P5Ta7PTFE2EKJWgLgv4skNklgr9Jbg7qnJNPeI=
X-Received: by 2002:a81:ae52:0:b0:536:155a:b73d with SMTP id
 g18-20020a81ae52000000b00536155ab73dmr10845609ywk.2.1677516618212; Mon, 27
 Feb 2023 08:50:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202301301057.e55dad5b-oliver.sang@intel.com> <Y9dETROtv9Bld9TI@casper.infradead.org>
 <20230131052352.5qnqegzwmt7akk7t@google.com> <Y9iq8fRT4sDgIwQN@casper.infradead.org>
 <20230131055743.tsilxx5vfl6gx4dj@google.com> <CALvZod7TuaJ7pCc2nJKehwGkcuvsvjdL+4hs6qC3bZsOmGzXzg@mail.gmail.com>
 <d5d0bcf75cbaa2792a3ad0e7b15a84fd67e54454.camel@intel.com>
In-Reply-To: <d5d0bcf75cbaa2792a3ad0e7b15a84fd67e54454.camel@intel.com>
From: Shakeel Butt <shakeelb@google.com>
Date: Mon, 27 Feb 2023 08:50:07 -0800
Message-ID: <CALvZod7wP9n+cqJV4VN3YNnf6CPQ8PJZbkAgK=fv84D4Sk+Heg@mail.gmail.com>
Subject: Re: [linus:master] [mm] f1a7941243: unixbench.score -19.2% regression
To: "Yin, Fengwei" <fengwei.yin@intel.com>
Cc: "willy@infradead.org" <willy@infradead.org>, "tj@kernel.org" <tj@kernel.org>, 
	"dennis@kernel.org" <dennis@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, lkp <lkp@intel.com>, 
	"zhengjun.xing@linux.intel.com" <zhengjun.xing@linux.intel.com>, "Huang, Ying" <ying.huang@intel.com>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "Tang, Feng" <feng.tang@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "Sang, Oliver" <oliver.sang@intel.com>, 
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, 
	"oe-lkp@lists.linux.dev" <oe-lkp@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 26, 2023 at 10:35=E2=80=AFPM Yin, Fengwei <fengwei.yin@intel.co=
m> wrote:
>
> Hi Andrew, Shakeel,
>
> On Tue, 2023-01-31 at 10:26 -0800, Shakeel Butt wrote:
> > +per-cpu memory maintainers for FYI.
> >
> > Thread started at
> > https://lore.kernel.org/linux-mm/202301301057.e55dad5b-oliver.sang@inte=
l.com/
> >
> > On Mon, Jan 30, 2023 at 9:57 PM Shakeel Butt <shakeelb@google.com>
> > wrote:
> > >
> > [...]
> > > >
> > > > We could cut down the number of calls to pcpu_alloc() by a factor
> > > > of 4
> > > > by having a pcpu_alloc_bulk() that would allocate all four RSS
> > > > counters
> > > > at once.
> > > >
> > > > Just throwing out ideas ...
> > >
> > > Thanks, I will take a stab at pcpu_alloc_bulk() and will share the
> > > result tomorrow.
> > >
> >
> > OK, not a one day effort.
> >
> > Andrew, which option do you prefer?
> >
> > 1. Keep the patches as the test workload (fork ping pong) is not a
> > representative of real world workload and work on improving
> > pcpu_alloc() for 6.4+.
> >
> > 2. Revert the patches for now, improve pcpu_alloc() and re-introduce
> > the patches once we confirm that fork-ping-pong is not regressed
> > anymore.
> This performance regression still can be reproduced on latest master
> branch. So we took option1 here. Right? Thanks.
>

Yes unless some real workload reports regression.

Shakeel
