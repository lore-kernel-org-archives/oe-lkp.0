Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31439EC1
	for <oe-lkp@lists.linux.dev>; Fri,  9 Dec 2022 11:30:57 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id c184so4154862vsc.3
        for <oe-lkp@lists.linux.dev>; Fri, 09 Dec 2022 03:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/0zi6P4igvYrvWb3SP8fLgjnuVZ+OCt+EX8p9F6aq4=;
        b=Q823rcukFYj2VrapNu1GjwA94nQzELCbQ7PFfks5ZBQqXL3a9IScSEz7iGy22oXukW
         bjezrrabOnMVEz9R1MlSBejqNVIubTDuekzTi1ngO1YP4wr9RKyEtqos5T+MofboJycE
         dHzawr5CEYBkWCQ7Sqo1hJn+3tDxlxIHsoT0b2v9+TqlpMwAcDPg2skm/S+lh8cUOAoZ
         M9SHn4hKm4+MtVJn/tXbAE5+q/vE9khXBBO8oXKXoIRWompTduwyIPTwafeZAf5g3/2q
         Af+7/jnaJqJPbZNbH28W+iWxGpvanT2RjnL7y9WdPvXybn0MaDi+6JtV4UqIQRHeQERr
         MvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/0zi6P4igvYrvWb3SP8fLgjnuVZ+OCt+EX8p9F6aq4=;
        b=0cV+dqECusp5AjVNHcdpbIT0qPpgxCC7cc7dLknWvEdjNfMiFZLW1qoauZLYw8JX1i
         UDkmYtJv4V9oyA8onsq/fZg+gMowm2fAWdczLFfCGqla4VvrJQ2A3Ly+ftXlAKVFq6Ug
         CFBMdssk0Jw8WL4Wkd2Prpk21y+9uS6XhToA4oolUD5usp/Qm4dEo5KZ02TgQK+KYGM2
         vDW98XDL3siHZWcquifG/TcgLBucZXgdxIZ1T76sVvJLFjzulcsV45Re28Ao7o4V7zzf
         Dlm2S1ovcAB/LAVoGZgmnDz9Hd0Xbd+t4cqoAQBiVYPs2/Ub19ELenEj3XpjsTK3DPLn
         aEow==
X-Gm-Message-State: ANoB5pk0nYcNGqiBr8Al2HGCsF1O/yQ+aU0ay1x+wX1aUfC3R2hnijF+
	n/7aA4XJ5JsvWaO6C7ZBLCWo+9eTfgO9JxEPcdDWHhDy0cg=
X-Google-Smtp-Source: AA0mqf58237o12vOXAdMfen+QCWrlJs3NhBYKJtmEPnq3RsOfB0qt6A1ldh3CRDkWlZ0VON70Nhh9PoIPev3fQBFMI0=
X-Received: by 2002:a05:6102:5710:b0:3b0:7462:a91 with SMTP id
 dg16-20020a056102571000b003b074620a91mr38174087vsb.36.1670585455871; Fri, 09
 Dec 2022 03:30:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212081500.58dd9ea4-yujie.liu@intel.com>
In-Reply-To: <202212081500.58dd9ea4-yujie.liu@intel.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 9 Dec 2022 13:30:44 +0200
Message-ID: <CAOQ4uxh-TDSwxOHc2aL3HpiC_Pd_qNaWCLLe1SUgfOZF7DQ6_w@mail.gmail.com>
Subject: Re: [amir73il:fan_pre_modify] [fanotify] 884a248730: unixbench.score
 -1.4% regression
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

..

On Fri, Dec 9, 2022 at 8:46 AM kernel test robot <yujie.liu@intel.com> wrot=
e:
>
> Hi Amir,
>
> We noticed a minor performance change on your fan_pre_modify branch.
> We tested commit 884a248730 and its parent 99f3242105 each for 8 runs,
> and the data is stable.

Thank you for testing this branch!
It was a good choice.

I am curious how do you choose which branches to test from my github,
because sometimes I push WIP or old backup branches which are not very
interesting to test.

>
> commit 884a248730:
> - 3453.2
> - 3454.0
> - 3463.3
> - 3466.0
> - 3470.9
> - 3478.6
> - 3485.7
> - 3488.2
>
> commit 99f3242105:
> - 3515.5
> - 3518.5
> - 3531.8
> - 3536.6
> - 3543.8
> - 3545.7
> - 3556.0
> - 3562.0
>
> Please check below report for details.

I pushed a new head 90b7623e35a9 to branch fan_pre_modify.

Added an optimization commit before the reported regression:
 eb235508a99b fanotify: introduce FAN_PRE_MODIFY permission event
 42f4f971729e fsnotify: optimize the case of no permission marks of any typ=
e
 ffb549cff3df fsnotify: define flags for pre-modify permission events

My expectation is that the optimization commit will improve performance
compared to its parent (and to Linus master) and that the rest of the commi=
ts
on branch fan_pre_modify will not loose any of the performance win.

My assumption is that the filesystem on which unixbench is executed
has some inotify watches (probably systemd) and that it does not have
any fanotify permission watches (i.e. no Anti-Malware installed).

Please re-test.
Thanks,
Amir.

>
>
> Greeting,
>
> FYI, we noticed a -1.4% regression of unixbench.score due to commit:
>
> commit: 884a2487305bbf19dc6f105f6e3a4f368217a3cd ("fanotify: introduce FA=
N_PRE_MODIFY permission event")
> https://github.com/amir73il/linux fan_pre_modify
>
> in testcase: unixbench
> on test machine: 128 threads 4 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2=
.00GHz (Ice Lake) with 256G memory
> with following parameters:
>
>         runtime: 300s
>         nr_task: 1
>         test: fstime
>         cpufreq_governor: performance
>
> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench
>
> Details are as below:
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
>   99f3242105 ("fsnotify: define flags for pre-modify permission events")
>   884a248730 ("fanotify: introduce FAN_PRE_MODIFY permission event")
>
> 99f3242105d7f6ae 884a2487305bbf19dc6f105f6e3
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       3535            -1.4%       3484        unixbench.score
>     480.28            -0.0%     480.26        unixbench.time.elapsed_time
>     480.28            -0.0%     480.26        unixbench.time.elapsed_time=
.max
>     207.50 =C4=85  7%      +1.0%     209.67 =C4=85  7%  unixbench.time.in=
voluntary_context_switches
>      10514            -0.3%      10488        unixbench.time.maximum_resi=
dent_set_size
>      20814            +0.0%      20819        unixbench.time.minor_page_f=
aults
>       4096            +0.0%       4096        unixbench.time.page_size
>      70.00            +0.0%      70.00        unixbench.time.percent_of_c=
pu_this_job_got
>     305.20            +0.1%     305.57        unixbench.time.system_time
>      34.35            -1.1%      33.98        unixbench.time.user_time
>     535.83 =C4=85  9%      -1.8%     526.00 =C4=85  8%  unixbench.time.vo=
luntary_context_switches
>  6.721e+08            -1.4%  6.626e+08        unixbench.workload
>
>
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <yujie.liu@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202212081500.58dd9ea4-yujie.liu@in=
tel.com
>
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
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
>
> --
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
