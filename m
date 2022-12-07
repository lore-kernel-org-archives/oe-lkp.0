Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B647D136D
	for <oe-lkp@lists.linux.dev>; Wed,  7 Dec 2022 09:05:40 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id 128so16587546vsz.12
        for <oe-lkp@lists.linux.dev>; Wed, 07 Dec 2022 01:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrauTsBYLclVGA1sgfFDe7vh1Luh92YV6d3aHoD3bz0=;
        b=h4hMzRq/5+1Hpo/prUblXMKL/LYU0SzhRpfY8qnMB8tOkA1+USH4CDiApHOpzyHumw
         oXWiyzlaJsCe1RzgS4jByGzcIEIG+L7FNjNoJuTtSeJJzs+AVcqBBrlpdkcwRXWtutiM
         xcPnVmK8NGxiax9VpF0Mlvk/0sT4ojw5sI0nxbUb2ciQNe1UqHIPk5dTi2iAlKFJgTuM
         F0lQ/waT6+oubMj2w4j5NWWu4Yd4EA15GmMXMHTzt51Rpmu7XzXVwSJ4A4CdS0/OyYTN
         KGrLArJ1myWPTMUIfy9J9RH9TO9eLZnkGwD2aV9ZiskmLppmd6W64krgLiwUfn5JDTC9
         rLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrauTsBYLclVGA1sgfFDe7vh1Luh92YV6d3aHoD3bz0=;
        b=kQy5zttFH91VJ8XczC95J1eyaoyK+K56NzllQMlvqRdlZVi07AwnMF/BGWrRAQ7Z2M
         KMGFq1ZZrgFesRut8RbtBK2OySLzXct/wFylaCoaqV2xbPbjfLYAtoz5fXJdQxBy9vfj
         yDn9bsiRqilOfzPuqrFs7S17Rn6aFlCiX0lefixfGJF09qQBRxR7ohTjOpiosEraXFAu
         oc/rYF+92mHqtrM5SA9RFnV9eaDn7nwFbl1sQoFY/+hfv7XXembOY+IN+HO9kMsMhj7v
         8QYarg70oZJSjUuZs/oL39clEM9PN7l5YXcJ+owUzDUfzVzqhVRSYz9Ex0/anguwf1sJ
         a8jQ==
X-Gm-Message-State: ANoB5plbzFmtTLHZUy6TgndGS6FZdnNSzbgB9ZBRUeZDDM7kD1gWqTuN
	znknr3JdaEomTDX3FFou//Hxd4QEgv/P2zjMV0s=
X-Google-Smtp-Source: AA0mqf6uy/nSPCvughgy2S4wI0ifbXllDQZft6g/k6qkoXxM4uxC3sf1dKpHuN2fv6N1SI3P92KVjLwcx729mstdVV0=
X-Received: by 2002:a67:fc51:0:b0:3b1:48c:8218 with SMTP id
 p17-20020a67fc51000000b003b1048c8218mr12963351vsq.71.1670403939487; Wed, 07
 Dec 2022 01:05:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212032038.a5aa4002-oliver.sang@intel.com> <CAOQ4uxj317GyWPbHQiw2-45+xjMvAjEHstEHcJmr_Fmv29xFUw@mail.gmail.com>
 <Y5BKYEF4pB+gIU+l@xsang-OptiPlex-9020>
In-Reply-To: <Y5BKYEF4pB+gIU+l@xsang-OptiPlex-9020>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 7 Dec 2022 11:05:28 +0200
Message-ID: <CAOQ4uxhbmWbKGMPxXA7cwGmt=93XJ9baCNtJM_JJJLsqgKjUVQ@mail.gmail.com>
Subject: Re: [amir73il:sb_write_barrier] [vfs] 95586ea7c5: unixbench.score
 -4.9% regression
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, kbuild test robot <lkp@intel.com>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 7, 2022 at 10:10 AM Oliver Sang <oliver.sang@intel.com> wrote:
>
> hi Amir,
>
> On Mon, Dec 05, 2022 at 06:30:12PM +0200, Amir Goldstein wrote:
> > On Sat, Dec 3, 2022, 3:06 PM kernel test robot <oliver.sang@intel.com>
> > wrote:
> >
> > >
> > > Greeting,
> > >
> > > FYI, we noticed a -4.9% regression of unixbench.score due to commit:
> > >
> > >
> > > commit: 95586ea7c597ef4e9712ceb101d03438c1ccde20 ("vfs: prepare for
> > > pre-modify permission events on write")
> > > https://github.com/amir73il/linux sb_write_barrier
> > >
> >
> > Hi Oliver,
> >
> > I pushed a fixed version for this branch
> > Can you please re-test?
>
> we tested on new branch, found the new commit
>   91d26357ebf0 ("vfs: prepare for pre-modify permission events on write")
> doesn't cause regression any longer, comparing to its parent.

Great! thanks for the re-test!

> but the branch HEAD
>   0f7a8c0b37ad ("syncfs: wait for in-progress write operations")
> seems still introduce a small regression
>
> e8a2a30b4b2edf99 91d26357ebf095c16183cdc5c77 0f7a8c0b37adcdf306f5aa3a778
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>       3538            -0.1%       3534            -1.9%       3469       =
 unixbench.score
>
> BTW, the score for v6.1-rc6 in our tests is about 3505
>
> not sure if the small regression on HEAD is still a concern?

The HEAD commit is just for testing so it is not a concern:

    syncfs: wait for in-progress write operations

    DO NOT MERGE!!!

    For testing of sb_write_barrier(), wait for started write operations
    before issueing syncfs() and fsfreeze.

>
> below is detail comparison FYI.
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/=
testcase:
>   gcc-11/performance/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/30=
0s/lkp-icl-2sp2/fstime/unixbench
>
> commit:
>   e8a2a30b4b2e ("vfs: implement 'vfs write barriers'")
>   91d26357ebf0 ("vfs: prepare for pre-modify permission events on write")
>   0f7a8c0b37ad ("syncfs: wait for in-progress write operations")
>
> e8a2a30b4b2edf99 91d26357ebf095c16183cdc5c77 0f7a8c0b37adcdf306f5aa3a778
> ---------------- --------------------------- ---------------------------
>          %stddev     %change         %stddev     %change         %stddev
>              \          |                \          |                \
>       3538            -0.1%       3534            -1.9%       3469       =
 unixbench.score
>     480.50            -0.0%     480.33            -0.0%     480.28       =
 unixbench.time.elapsed_time
>     480.50            -0.0%     480.33            -0.0%     480.28       =
 unixbench.time.elapsed_time.max
>     184.00 =C4=85101%     -23.9%     140.00 =C4=85133%     -17.4%     152=
.00 =C4=85132%  unixbench.time.file_system_inputs
>       2332 =C4=85110%     -17.2%       1932 =C4=85137%      -0.2%       2=
328 =C4=85129%  unixbench.time.file_system_outputs
>     221.25 =C4=85  7%      -9.1%     201.12 =C4=85  9%      -6.4%     207=
.12 =C4=85 11%  unixbench.time.involuntary_context_switches
>      10534            -0.8%      10449            -0.7%      10460       =
 unixbench.time.maximum_resident_set_size
>      20681            +0.3%      20749            -0.0%      20678       =
 unixbench.time.minor_page_faults
>       4096            +0.0%       4096            +0.0%       4096       =
 unixbench.time.page_size
>      70.00            +0.0%      70.00            +0.0%      70.00       =
 unixbench.time.percent_of_cpu_this_job_got
>     305.51            +0.1%     305.76            +0.4%     306.76       =
 unixbench.time.system_time
>      34.03            -0.7%      33.80            -3.7%      32.78       =
 unixbench.time.user_time
>     543.00 =C4=85  8%      -2.2%     530.88 =C4=85  7%      +1.3%     550=
.25 =C4=85 10%  unixbench.time.voluntary_context_switches
>  6.728e+08            -0.1%  6.719e+08            -2.0%  6.596e+08       =
 unixbench.workload
>  6.153e+10            -0.0%  6.151e+10            +0.0%  6.153e+10       =
 cpuidle..time
>    1189251            +2.1%    1214078 =C4=85  2%      +1.2%    1203611 =
=C4=85  2%  cpuidle..usage
>       3.75 =C4=85129%     -33.3%       2.50 =C4=85173%     +33.3%       5=
.00 =C4=85100%  dmesg.bootstage:last
>     215.78 =C4=85108%     +62.0%     349.65 =C4=85 76%      -0.1%     215=
.48 =C4=85106%  dmesg.timestamp:last

I am not familiar of how the unixbench.score is calculated, but an
increase in cpuidle time and overall test wall time makes sense considering
that the test commit adds an unsolicited sb_write_barrier(), that is not go=
ing
to be in the final patch submission.

Thanks again!
Amir.
