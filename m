Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0959020E1
	for <oe-lkp@lists.linux.dev>; Sun, 23 Apr 2023 13:50:32 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-3ef36d814a5so1387511cf.0
        for <oe-lkp@lists.linux.dev>; Sun, 23 Apr 2023 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682257832; x=1684849832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyRqlqH+VocvSLvf8Cs9BeqUc8anbkSQ/JobZuPLOz4=;
        b=doVqfcmnfTMcU1JUXPOhHBk0gMNw0dWSGOCV8Q++v9Vdz+TD5EyR5UrsLJGo6DvA6L
         jvSTRmQ2DN7KOXidgD11FbOxfv0LA8voZH8hOVmgvuFV8ntAqUqKKByy+XqghEooxD2G
         QEE+IcqGY8EqG+atlmfXAP+SVVehKRASBpAlpyqRg5JbsgGdVhIRHmSNBiT6rHeJprbr
         e5zBUYKlGmJvqqtn/LSoIxDCGD4xN6YtPiIyrU1y+EfxtbjNDCQk9OMeJiIKxmle6qif
         pyjz+POsEWg/dlPmWYNFSBx9nAJQaN27B9ma61NP8ck9kK4kMWaUePjUTnhAnkS+7K49
         ZHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682257832; x=1684849832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZyRqlqH+VocvSLvf8Cs9BeqUc8anbkSQ/JobZuPLOz4=;
        b=KwwjKj5eNeMj51/W/67BKHxDbKdnB0kPPllUWAxOUz50RDMgF2VQa8BdkWOqrerf2h
         TrhdbNBoaqo3i9vfuds1NNLLzhMi4qVLmkaUlJ7eSo6Nv9G9oXtMK9OCxjICiNjhCK9U
         rOghkwl01eFOK+LgV1+KhGrjDw0gXbfnCDjTC3ZndJRldsFCn3D2vNjET8mzpTFh+cOG
         Acm0EltGy4i/yv2TSe37JIqR9rYIPN8g3sDjKld1pI8hE4m2PvlRmMGWLf5dCdwSPxXe
         jYC1tRJVBG4b/W/ArSPJCzm/JStNsbvOeE2jj/oWcGFlqaqIkMOAeQkcSDj30NhPHhlV
         fcGA==
X-Gm-Message-State: AAQBX9diY8aB6crDWCXV74m1rDGOj4mdAmy3ALVmclf4D588/xwFFiNb
	jgx7pjHlIO7BcVU/LZY+OtCE8gbmoByjNzfB+b0hRg==
X-Google-Smtp-Source: AKy350bfTV91nZ12wkSAkeXAw+Los8BXD/na0U/L8j8pEBCCdq1RXFfNO9TYJ1MIhCk1JUAmbOLs69XFGr5PQTtOYo4=
X-Received: by 2002:a05:622a:351:b0:3ef:62f2:52df with SMTP id
 r17-20020a05622a035100b003ef62f252dfmr320539qtw.9.1682257831737; Sun, 23 Apr
 2023 06:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202304231436.60a4979b-oliver.sang@intel.com>
In-Reply-To: <202304231436.60a4979b-oliver.sang@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 23 Apr 2023 06:50:19 -0700
Message-ID: <CAP-5=fV1u3LUP2S=LB8+w2Bwy1MEWme9Py_B6ZfDpYQ4aW3XdQ@mail.gmail.com>
Subject: Re: [linux-next:master] [perf vendor events intel] 9d9675bb41: perf-sanity-tests.perf_all_metricgroups_test.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Caleb Biggers <caleb.biggers@intel.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Florian Fischer <florian.fischer@muhq.space>, 
	Ingo Molnar <mingo@redhat.com>, James Clark <james.clark@arm.com>, 
	Jing Zhang <renyu.zj@linux.alibaba.com>, Jiri Olsa <jolsa@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Leo Yan <leo.yan@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Namhyung Kim <namhyung@kernel.org>, Perry Taylor <perry.taylor@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Sandipan Das <sandipan.das@amd.com>, Sean Christopherson <seanjc@google.com>, 
	Stephane Eranian <eranian@google.com>, Suzuki Poulouse <suzuki.poulose@arm.com>, 
	Xing Zhengjun <zhengjun.xing@linux.intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 22, 2023 at 11:54=E2=80=AFPM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "perf-sanity-tests.perf_all_metricgroups_test.f=
ail" on:
>
> commit: 9d9675bb411b08bc6c5bb2f399ee497f5880b551 ("perf vendor events int=
el: Refresh skylake events")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master 44bf136283e567b2b62653be7630e7511da41da=
2]
>
> (we reported [ammarfaizi2-block:acme/linux/perf-tools-next] [perf vendor =
events intel]  9d9675bb41: perf-sanity-tests.perf_all_metricgroups_test.fai=
l
> on https://lore.kernel.org/all/202303080946.e5743bf5-oliver.sang@intel.co=
m/
> when this commit is on https://github.com/ammarfaizi2/linux-block acme/li=
nux/perf-tools-next
> since now it's on linux-next/master and we still observed same issue, rep=
ort
> again FYI)
>
> in testcase: perf-sanity-tests
> version: perf-x86_64-00c7b5f4ddc5-1_20230402
> with following parameters:
>
>         perf_compiler: gcc
>
>
>
> compiler: gcc-11
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz=
 (Kaby Lake) with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
>
>
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202304231436.60a4979b-oliver.sang@=
intel.com
>
>
>
> 2023-04-21 05:44:17 sudo /usr/src/perf_selftests-x86_64-rhel-8.3-func-9d9=
675bb411b08bc6c5bb2f399ee497f5880b551/tools/perf/perf test 101
> 101: perf all metricgroups test                                      : FA=
ILED!
>

I wasn't able to reproduce this in perf-tools-next with -fsanitize=3Daddres=
s:

102: perf all metricgroups test                                      : Ok

The blame on this also looks questionable as Skylake events aren't
applicable on Kabylake.

Thanks,
Ian

>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
>
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>
>
