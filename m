Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3696125
	for <oe-lkp@lists.linux.dev>; Mon,  5 Dec 2022 17:18:40 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id 7so15310072ybp.13
        for <oe-lkp@lists.linux.dev>; Mon, 05 Dec 2022 09:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/Nonq3ctTs1UWfb6KWW7MIlmF7kFHhRG27VQydMtVk=;
        b=lFSZfm4kDAFsl8Bae1pr7+oePLNotDcRIIDlIY5J8R4O0WC0aEVF0wcgS5RWNmniso
         txXy+BNgs9f8iTbaG5ahYH79+AdjemxKo5xKnqmnLh/vAsqi92wfqhVk6KgKrnzEu200
         sK66uLMEezea15MPVJg+y47XZbPzcLTme3ywb/HGqTxWuSEGIkt1Zw7oH2FAEygSQRbY
         ZJXPCPxAh3Ed+nxSir+x09p8Pejz+1SKW5K92Qp6RIKYNbqwUgjD9GYeXcOLD2VcHEFG
         nwcHRySs2889m4rg93crVDccyBkbNyEq2BPvpkIRhEEmi6rRN7crHILQjVKnK0MvgLeM
         ejTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/Nonq3ctTs1UWfb6KWW7MIlmF7kFHhRG27VQydMtVk=;
        b=GWP5SKu8qoSQuxnf/I7KZ/60kAWSeLV2IjvjoSqXdi2ppV6f22/xZHXIh6u/Qp0mJF
         1fDlw/2/JbCT2pzApxyuy+uWraM+d29TMXCzudTT8PfrYe0+lCtBsq87CTNLfA+xuHcX
         SWyyvj8qG7zT5N3LFuZ2EkSf+Ti6sJC3H6Gnd1du6Qt/bKtfJhjU0upN/4EhC3/HT+z7
         /5yqqSiby4cZMj/+Vqfdd0rfeSFpEaQkXwqZNkTJGAzdPbYKrOkIIK4jsT9Jl3VWDilV
         4tzxO2A49rxTJh4Gz7hv1HOEFw6Su8cKfCjRJ4pJZpHJPQfky/wN7Tfuh/p5quDypPy7
         WGIQ==
X-Gm-Message-State: ANoB5pkrHVc05/lJnjC5mO5ATXfEA6EUXW9kWAbZWVTVWUD6togdWPK1
	HXz86cFiOU7qHTP12HNi/X1V9tixbfsShRf3erBoTA==
X-Google-Smtp-Source: AA0mqf4WwhfDj4SfV0gayow9/xNOHxtZYvzoJMotYVfsb0rBXTMBhrwctNTPhYy7zkevJoo6TTUBFkTVlmi+HMGTjjc=
X-Received: by 2002:a5b:841:0:b0:6e5:92af:5731 with SMTP id
 v1-20020a5b0841000000b006e592af5731mr59525430ybq.228.1670260719051; Mon, 05
 Dec 2022 09:18:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202212051324.182a6363-yujie.liu@intel.com>
In-Reply-To: <202212051324.182a6363-yujie.liu@intel.com>
From: Shakeel Butt <shakeelb@google.com>
Date: Mon, 5 Dec 2022 09:18:28 -0800
Message-ID: <CALvZod4CD+O7-ynGAHU-6vxE6CbSmuQei1=SVJsx0zFfQdmV2g@mail.gmail.com>
Subject: Re: [linux-next:master] [mm] f1a7941243: unixbench.score -5.1% regression
To: kernel test robot <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Andrew Morton <akpm@linux-foundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, zhengjun.xing@linux.intel.com, fengwei.yin@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 4, 2022 at 9:56 PM kernel test robot <yujie.liu@intel.com> wrot=
e:
>
> Greeting,
>
> FYI, we noticed a -5.1% regression of unixbench.score due to commit:
>
[...]
> 9cd6ffa60256e931 f1a7941243c102a44e8847e3b94
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>       7917            -5.1%       7509        unixbench.score

What is unixbench.score?

>      10485           -12.1%       9216        unixbench.time.maximum_resi=
dent_set_size
>   37236706            -5.1%   35324104        unixbench.time.minor_page_f=
aults

For above two, is negative change good or bad?

>       0.98 =C4=85 20%      +0.7        1.64 =C4=85 38%  perf-profile.call=
trace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x6=
4_sys_openat
>       2.12 =C4=85 19%      +0.8        2.96 =C4=85 13%  perf-profile.call=
trace.cycles-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_p=
age_fault
>       2.35 =C4=85 13%      +0.9        3.28 =C4=85 13%  perf-profile.call=
trace.cycles-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_pa=
ge_fault.asm_exc_page_fault
>       0.14 =C4=85 74%      +0.4        0.55 =C4=85 32%  perf-profile.chil=
dren.cycles-pp.do_task_dead
>       0.04 =C4=85223%      +0.4        0.47 =C4=85 49%  perf-profile.chil=
dren.cycles-pp.__mmdrop

Also how should I interpret the above perf-profiles?
