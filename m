Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E6D7E5
	for <oe-lkp@lists.linux.dev>; Wed, 29 Mar 2023 16:54:54 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3e0965f70ecso343751cf.0
        for <oe-lkp@lists.linux.dev>; Wed, 29 Mar 2023 09:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680108893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mmMTcKbNFZJ+ADW94MCmFYakixmyIY5T+sGgFQVqJY=;
        b=EcvUtO42jTnqBkvpZAcPDRX1B/EBgeIHIvGlYQxBY9ZpicDaqou6cUmnVTgvVlrkuT
         34nkDwRTApfZRQfmmpXskr3uYUE3mfpGxAAolVUJxfAP3MYo9aFBD2kDCVpUwe7mt+bY
         agwP1g9K5cHbZldk8q82nVJkXZwLdLl+Yo+zmFryh42iqo2u61fy1gqnWYo1CW2vx7zG
         V3pBuL3iZiTrxZSk1nCdqEAb2T8su9Pl5+fmoyj9INWPh5VgvnRRCJD3KS88j2HXTFuQ
         vyGAUsDslmzrJwu765Hv54PjFJdloMIn+Iz0lRb96Oz9rEvgegkhtCA1ThQDmXg0wAeU
         taEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680108893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mmMTcKbNFZJ+ADW94MCmFYakixmyIY5T+sGgFQVqJY=;
        b=tI/FT+dJmsLDCjHW7Gt5bJAJUv3lF16P1yjFkTHjrZuBZF3RCjHhbL6ud3RqJH6bFJ
         gXBt9gRNUzgDbBhp4XWT2mG+uNpzXuntLt5t9YEyZ565kfL1qqS25wC9k34G5lWoKeJy
         7tUkGPVbo0QevQErGoWufzwaeA6pL+IFuXecWXrcvgOs/9MWs8gedkBdedFj4+XmNEde
         14piID++XsPDt1d0B8FWa1veoWFF1Uq0Qae3S4jT1reAig/kiY8aoT6L6b5WoWzOHXL7
         rKhxp6+Hpe1USoep9Lio/s5UWJ7Ys53vxtkakgeZqekq7OR5EvoW0zw3rojUT5iGVZDB
         ybyg==
X-Gm-Message-State: AAQBX9csX1vBg0lApX16QpN3zfiYrUc/Zc7mc26mHxHWwNhdPPyIVqWb
	g4In5DOJ3X56nrcWMLU6Gt7TB/ZvpUUziWFSdQ6IRw==
X-Google-Smtp-Source: AKy350aZEuGOkGAUo3/PlvmvlZZ+e7ire4m+tofzP4fSUzLBgqwscgupalCGJKg/ccutDUs+9sYPCXIF0zSlFtAKH3c=
X-Received: by 2002:ac8:5916:0:b0:3e3:86d0:4f02 with SMTP id
 22-20020ac85916000000b003e386d04f02mr368594qty.11.1680108893525; Wed, 29 Mar
 2023 09:54:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202303222158.8975b36d-oliver.sang@intel.com> <CAP-5=fV3x_=6JqVsX8Z_+5bz67de_5JcWX-1B=So18wpMK3r=A@mail.gmail.com>
 <ZCPX5bYv0zK+/a6u@xsang-OptiPlex-9020>
In-Reply-To: <ZCPX5bYv0zK+/a6u@xsang-OptiPlex-9020>
From: Ian Rogers <irogers@google.com>
Date: Wed, 29 Mar 2023 09:54:39 -0700
Message-ID: <CAP-5=fVV-3jYnJsrLZjqoJz3DzmT4b5t==Y3joC0NHgpz-qp-w@mail.gmail.com>
Subject: Re: [acme:tmp.perf-tools-next] [perf build] a980755beb: perf-sanity-tests.perf.make.fail
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andres Freund <andres@anarazel.de>, 
	Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Leo Yan <leo.yan@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Martin_Li=C5=A1ka?= <mliska@suse.cz>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Pavithra Gurushankar <gpavithrasha@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Quentin Monnet <quentin@isovalent.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Stephane Eranian <eranian@google.com>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Tom Rix <trix@redhat.com>, 
	Yang Jihong <yangjihong1@huawei.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2023 at 11:17=E2=80=AFPM Oliver Sang <oliver.sang@intel.com=
> wrote:
>
> hi Ian,
>
> On Wed, Mar 22, 2023 at 09:03:28AM -0700, Ian Rogers wrote:
> > On Wed, Mar 22, 2023 at 7:20=E2=80=AFAM kernel test robot <oliver.sang@=
intel.com> wrote:
> > >
> > >
> > > Greeting,
> > >
> > > FYI, we noticed perf-sanity-tests.perf.make.fail due to commit (built=
 with gcc-11):
> > >
> > > commit: a980755beb5aca9002e1c95ba519b83a44242b5b ("perf build: Make B=
UILD_BPF_SKEL default, rename to NO_BPF_SKEL")
> > > https://git.kernel.org/cgit/linux/kernel/git/acme/linux.git tmp.perf-=
tools-next
> > >
> > > in testcase: perf-sanity-tests
> > > version: perf-x86_64-e8d018dd0257-1_20230320
> > > with following parameters:
> > >
> > >         perf_compiler: clang
> > >
> > > [   98.290078][  T246] make perf failed
> >
> > Hi Oliver,
> >
> > Could we add NO_BPF_SKEL=3D1 to the build flags? The idea with changing
> > the default is that is what most users want and so we want the BPF
> > skeleton to be opt-out rather than opt-in.
>
> Thanks a lot for guidance!
>
> I added NO_BPF_SKEL=3D1 then make perf can pass upon this commit.
> I also tried to add BUILD_BPF_SKEL=3D1 while make perf for parent, it wil=
l fail.
>
> since you said in commit message
> "BPF skeleton support is now key to a number of perf features."
> we will start to fix make issue.
>
> Thanks!

This is great Oliver, many thanks!
Ian

> >
> > Thanks,
> > Ian
> >
> > >
> > > To reproduce:
> > >
> > >         git clone https://github.com/intel/lkp-tests.git
> > >         cd lkp-tests
> > >         sudo bin/lkp install job.yaml           # job file is attache=
d in this email
> > >         bin/lkp split-job --compatible job.yaml # generate the yaml f=
ile for lkp run
> > >         sudo bin/lkp run generated-yaml-file
> > >
> > >         # if come across any failure that blocks the test,
> > >         # please remove ~/.lkp and /lkp dir to run from a clean state=
.
> > >
> > >
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests
> > >
> > >
> >
