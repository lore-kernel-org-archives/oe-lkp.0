Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141448F70
	for <oe-lkp@lists.linux.dev>; Mon, 26 Jun 2023 13:31:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2FAE621833;
	Mon, 26 Jun 2023 13:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1687786303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MxZGDXxu3vMe42hBLlBKxWQO6rjliKhQL5TFJ1pHPGY=;
	b=PadlDBzrpCqhXpcMWEFPam7+oLYqo4+GeIUOZGzkkNnGbxVYmV9jRfEijGXjorvAVSjSgK
	+MgMc3EkEsA/vakepVVXjbEp8dCPJaJKW1F3rZXVjgcXdSSd6wWhZgeMrvvTGwFUqonD4s
	o5jkCh1lM4ZlgceLsPLuHcSErWzArd8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1687786303;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MxZGDXxu3vMe42hBLlBKxWQO6rjliKhQL5TFJ1pHPGY=;
	b=7Q12mYl5XObqEb0gGGuFAz+UNGDlG8WF08Btng9VkqxVrYFaTSesNvgHUG9E2Z6IuwumWR
	ZjCjgtHBIHvh5IBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3AD113483;
	Mon, 26 Jun 2023 13:31:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AccvMz6TmWQcaQAAMHmgww
	(envelope-from <jack@suse.cz>); Mon, 26 Jun 2023 13:31:42 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 537C5A0754; Mon, 26 Jun 2023 15:31:42 +0200 (CEST)
Date: Mon, 26 Jun 2023 15:31:42 +0200
From: Jan Kara <jack@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Oliver Sang <oliver.sang@intel.com>, Jan Kara <jack@suse.cz>,
	oe-lkp@lists.linux.dev, lkp@intel.com
Subject: Re: [amir73il:sb_write_barrier] [vfs] e796a59711:
 stress-ng.ramfs.ops_per_sec -13.0% regression
Message-ID: <20230626133142.xdcwu7akidnftrla@quack3>
References: <202306192245.d77d7216-oliver.sang@intel.com>
 <CAOQ4uxj_md8KqiQ=TTMC7Kv5VFtREfB8T3agB+pVH8STye_5Vw@mail.gmail.com>
 <ZJWwrHozI2GkRnJ6@xsang-OptiPlex-9020>
 <CAOQ4uxg8rr-uHUo62nrZzfp14UpNAz1K9YxyaAq7D2ggAFLHMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxg8rr-uHUo62nrZzfp14UpNAz1K9YxyaAq7D2ggAFLHMg@mail.gmail.com>

Hi Amir!

On Sat 24-06-23 16:18:14, Amir Goldstein wrote:
> On Fri, Jun 23, 2023 at 5:48 PM Oliver Sang <oliver.sang@intel.com> wrote:
> > On Tue, Jun 20, 2023 at 02:36:51PM +0300, Amir Goldstein wrote:
> > > On Tue, Jun 20, 2023 at 4:44 AM kernel test robot <oliver.sang@intel.com> wrote:
> > > > kernel test robot noticed a -13.0% regression of stress-ng.ramfs.ops_per_sec on:
> > > >
> > > >
> > > > commit: e796a59711433d5400947b2dbfaf35d465840842 ("vfs: implement 'vfs write barriers'")
> > > > https://github.com/amir73il/linux sb_write_barrier
> > > >
> > >
> > > Considering that this commit only adds helpers but never uses them
> > > this regression is a bit surprising.
> > >
> > > You had reported regressions in the past on the next commit:
> > > "vfs: prepare for pre-modify permission events on write"
> > >
> > > which made sense and I had since fixed and you verified.
> > >
> > > The only suspect I can think of is that adding the new s_write_*
> > > members to struct super_block had split the frequently access
> > > members s_fsnotify_connectors and s_readonly_remount into
> > > different cachelines.
> > >
> > > I've moved those new members to another location in the
> > > super_block struct and pushed the new branch to:
> > >
> > > https://github.com/amir73il/linux sb_write_barrier
> > >
> > > I've added another commit at the tip of this branch:
> > > 67d1802889f0 ("fsnotify: activate sb write barriers for permission
> > > event watchers")
> > >
> > > This commit also adds a new member to struct super_block,
> > > next to s_fsnotify_connectors and s_readonly_remount, but this
> > > new member is also frequently accessed.
> > >
> > > I am hoping that you can also verify that the tip commit does not
> > > cause a regression.
> >
> > I finished the test on updated branch, but seems regression not be fixed.
> >
> >   d0c30b5ebd657 (amir73il/fan_access_range) fanotify: report file range info with FAN_ACCESSS_PERM
> >   f995c9620bfd7 vfs: implement 'vfs write barriers'
> >   309b0dd357c60 vfs: prepare for pre-modify permission events on write
> >   67d1802889f02 (amir73il/sb_write_barrier) fsnotify: activate sb write barriers for permission event watchers
> >
> > d0c30b5ebd6579cc f995c9620bfd75a07a2c8a8d70c 309b0dd357c60a5e541766ef097 67d1802889f02cd626d5924339a
> > ---------------- --------------------------- --------------------------- ---------------------------
> >          %stddev     %change         %stddev     %change         %stddev     %change         %stddev
> >              \          |                \          |                \          |                \
> >    1377718           -13.8%    1187511 ±  2%     -14.4%    1179629           -14.0%    1185167        stress-ng.ramfs.ops
> >      22961           -13.8%      19791 ±  2%     -14.4%      19660           -14.0%      19752        stress-ng.ramfs.ops_per_sec
> >
> > all detail comparison is as below, I also attached the config to build all
> > these four kernels.
> >
> 
> Thank you Oliver!
> 
> Jan,
> 
> Do you have an idea of what might be going on here?

Not really.

> The only code change in the regressing commit is the addition
> of the s_write_* members to super_block and the addition of
> init_srcu_struct() call in alloc_super().
> 
> Unless I am missing something.

No, you are right. But it could also be some code alignment changing after
adding those new functions. Can you reproduce the regression on your
machine? If yes, you could have a look at some micro-architectural perf
counters like iTLB misses or similar to see e.g. whether code of some hot
function didn't get split among two cachelines or similar issue. There's
also CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B which can help in determining
whether function alignment is the issue or not.

Frankly, when confirmed the issue is with code alignment, I usually tend to
ignore it except for the hottest loops / functions (like memset(), memcpy()
and similar) because for normal functions it is a win or loss depending on
the particular microbenchmark.

								Honza

> > =========================================================================================
> > class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
> >   os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/ramfs/stress-ng/60s
> >
> > commit:
> >   d0c30b5ebd657 (amir73il/fan_access_range) fanotify: report file range info with FAN_ACCESSS_PERM
> >   f995c9620bfd7 vfs: implement 'vfs write barriers'
> >   309b0dd357c60 vfs: prepare for pre-modify permission events on write
> >   67d1802889f02 (amir73il/sb_write_barrier) fsnotify: activate sb write barriers for permission event watchers
> >
> > d0c30b5ebd6579cc f995c9620bfd75a07a2c8a8d70c 309b0dd357c60a5e541766ef097 67d1802889f02cd626d5924339a
> > ---------------- --------------------------- --------------------------- ---------------------------
> >          %stddev     %change         %stddev     %change         %stddev     %change         %stddev
> >              \          |                \          |                \          |                \
> >   2.15e+09            -0.2%  2.146e+09            -0.1%  2.147e+09            -0.3%  2.144e+09        cpuidle..time
> >    3626267            +2.7%    3723533            +0.5%    3643077            -2.4%    3540533        cpuidle..usage
> >      94.20            +0.4%      94.59            +0.8%      94.96 ±  2%      -0.4%      93.83        uptime.boot
> >       3164            +0.3%       3172            +0.7%       3186            -0.4%       3151        uptime.idle
> >      21.92            +1.1%      22.16 ±  7%      +1.5%      22.24 ±  8%      -0.7%      21.75        boot-time.boot
> >      12.15 ±  2%      +4.3%      12.67 ±  9%      +5.4%      12.81 ± 15%      +0.3%      12.18        boot-time.dhcp
> >     730.73            +0.5%     734.39 ±  5%      +0.8%     736.74 ±  6%      -0.8%     725.09        boot-time.idle
> >      93.62            -0.0%      93.59            +0.0%      93.65            -0.0%      93.60        iostat.cpu.idle
> >       0.16 ± 19%     +19.7%       0.19 ± 19%      -2.4%       0.15 ±  7%      +9.0%       0.17 ± 50%  iostat.cpu.iowait
> >       3.63            +1.1%       3.67            +1.0%       3.67            +1.2%       3.68        iostat.cpu.system
> >       2.59            -1.8%       2.54            -2.5%       2.53            -1.4%       2.55        iostat.cpu.user
> >      93.55            -0.0       93.53            +0.0       93.58            -0.0       93.53        mpstat.cpu.all.idle%
> >       0.15 ± 21%      +0.0        0.17 ± 15%      -0.0        0.14 ± 10%      +0.0        0.16 ± 55%  mpstat.cpu.all.iowait%
> >       0.56 ±  2%      +0.0        0.57 ±  2%      +0.0        0.57 ±  2%      -0.0        0.55        mpstat.cpu.all.irq%
> >       0.14 ±  2%      -0.0        0.10 ± 34%      -0.0        0.11 ± 25%      -0.0        0.11 ± 32%  mpstat.cpu.all.soft%
> >       2.97            +0.1        3.04            +0.1        3.03            +0.1        3.04        mpstat.cpu.all.sys%
> >       2.63            -0.0        2.59            -0.1        2.57            -0.0        2.60        mpstat.cpu.all.usr%
> >      62.03            +0.0%      62.03            +0.0%      62.06            +0.0%      62.03        time.elapsed_time
> >      62.03            +0.0%      62.03            +0.0%      62.06            +0.0%      62.03        time.elapsed_time.max
> >      14.40 ± 22%      -7.4%      13.33 ± 28%     -25.9%      10.67 ± 35%     -11.1%      12.80 ± 30%  time.file_system_inputs
> >    2760309           -12.4%    2418439 ±  2%     -13.0%    2401566           -12.5%    2414316        time.involuntary_context_switches
> >       0.40 ±122%     +66.7%       0.67 ±111%    +108.3%       0.83 ±107%    -100.0%       0.00        time.major_page_faults
> >       6969 ±  3%      -1.5%       6864 ±  2%      -0.1%       6960 ±  2%      +0.0%       6969        time.maximum_resident_set_size
> >       9403            -0.3%       9371            -0.3%       9376            -0.4%       9361        time.minor_page_faults
> >       4096            +0.0%       4096            +0.0%       4096            +0.0%       4096        time.page_size
> >      75.00            +0.4%      75.33            +0.9%      75.67            +1.6%      76.20        time.percent_of_cpu_this_job_got
> >      40.03            +3.2%      41.31            +4.0%      41.64            +4.7%      41.89        time.system_time
> >       6.85           -15.5%       5.79 ±  8%     -16.3%       5.73 ±  2%     -16.6%       5.71 ±  2%  time.user_time
> >     355622 ± 14%     +42.2%     505661 ± 13%     +21.1%     430817 ± 15%     -13.4%     308012 ± 12%  time.voluntary_context_switches
> >      93.00            +0.0%      93.00            +0.0%      93.00            +0.0%      93.00        vmstat.cpu.id
> >       3.00            +0.0%       3.00            +0.0%       3.00            +0.0%       3.00        vmstat.cpu.sy
> >       2.00            +0.0%       2.00            +0.0%       2.00            +0.0%       2.00        vmstat.cpu.us
> >       0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        vmstat.cpu.wa
> >      15.00            +0.0%      15.00            +0.0%      15.00            +0.0%      15.00        vmstat.io.bi
> >     375.00 ±  4%      +9.3%     409.83 ± 19%     +14.4%     429.00 ± 21%      -4.6%     357.60 ±  3%  vmstat.io.bo
> >       2052            +0.2%       2056            +1.0%       2073            +0.5%       2062        vmstat.memory.buff
> >    3257813            -0.7%    3235379            -0.8%    3232739            -0.8%    3233180        vmstat.memory.cache
> >  1.276e+08            -6.7%  1.191e+08            -6.7%  1.191e+08            -6.7%  1.191e+08        vmstat.memory.free
> >       0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        vmstat.procs.b
> >       2.00            +0.0%       2.00            +0.0%       2.00           -10.0%       1.80 ± 22%  vmstat.procs.r
> >     184174            -4.0%     176739            -7.4%     170573 ±  3%     -10.7%     164543        vmstat.system.cs
> >      81544            -0.6%      81066            -2.8%      79288            -4.8%      77608        vmstat.system.in
> >    1377718           -13.8%    1187511 ±  2%     -14.4%    1179629           -14.0%    1185167        stress-ng.ramfs.ops
> >      22961           -13.8%      19791 ±  2%     -14.4%      19660           -14.0%      19752        stress-ng.ramfs.ops_per_sec
> >      62.03            +0.0%      62.03            +0.0%      62.06            +0.0%      62.03        stress-ng.time.elapsed_time
> >      62.03            +0.0%      62.03            +0.0%      62.06            +0.0%      62.03        stress-ng.time.elapsed_time.max
> >      14.40 ± 22%      -7.4%      13.33 ± 28%     -25.9%      10.67 ± 35%     -11.1%      12.80 ± 30%  stress-ng.time.file_system_inputs
> >    2760309           -12.4%    2418439 ±  2%     -13.0%    2401566           -12.5%    2414316        stress-ng.time.involuntary_context_switches
> >       0.40 ±122%     +66.7%       0.67 ±111%    +108.3%       0.83 ±107%    -100.0%       0.00        stress-ng.time.major_page_faults
> >       6969 ±  3%      -1.5%       6864 ±  2%      -0.1%       6960 ±  2%      +0.0%       6969        stress-ng.time.maximum_resident_set_size
> >       9403            -0.3%       9371            -0.3%       9376            -0.4%       9361        stress-ng.time.minor_page_faults
> >       4096            +0.0%       4096            +0.0%       4096            +0.0%       4096        stress-ng.time.page_size
> >      75.00            +0.4%      75.33            +0.9%      75.67            +1.6%      76.20        stress-ng.time.percent_of_cpu_this_job_got
> >      40.03            +3.2%      41.31            +4.0%      41.64            +4.7%      41.89        stress-ng.time.system_time
> >       6.85           -15.5%       5.79 ±  8%     -16.3%       5.73 ±  2%     -16.6%       5.71 ±  2%  stress-ng.time.user_time
> >     355622 ± 14%     +42.2%     505661 ± 13%     +21.1%     430817 ± 15%     -13.4%     308012 ± 12%  stress-ng.time.voluntary_context_switches
> >     260.40            +0.5%     261.67            -0.0%     260.33            +0.1%     260.60        turbostat.Avg_MHz
> >       6.93            +0.0        6.96            -0.0        6.92            -0.0        6.93        turbostat.Busy%
> >       3753            +0.1%       3758            +0.1%       3758            +0.2%       3760        turbostat.Bzy_MHz
> >     158528           -20.0%     126746 ±  2%     -23.7%     121031 ±  4%     -19.3%     128009 ±  4%  turbostat.C1
> >       0.20 ±  3%      -0.0        0.18 ±  6%      -0.0        0.18 ±  7%      -0.0        0.18 ±  8%  turbostat.C1%
> >    1192913            -0.1%    1192259            -1.0%    1180912            -0.5%    1187383        turbostat.C1E
> >       5.87            +0.0        5.88            -0.2        5.72            +0.0        5.87 ±  6%  turbostat.C1E%
> >    2048935            -0.2%    2045629            +0.0%    2049836            -0.2%    2043994        turbostat.C6
> >      87.27            -0.0       87.25            +0.2       87.45            +0.0       87.27        turbostat.C6%
> >      92.04            +0.1%      92.16            +0.2%      92.22            +0.2%      92.22        turbostat.CPU%c1
> >       1.02 ± 12%     -13.9%       0.88 ± 11%     -16.0%       0.86 ± 14%     -16.8%       0.85 ±  4%  turbostat.CPU%c6
> >      41.00            +0.8%      41.33 ±  2%      +0.0%      41.00 ±  2%      -0.5%      40.80        turbostat.CoreTmp
> >       0.43            -2.6%       0.42            +0.1%       0.43 ±  2%      -0.9%       0.42        turbostat.IPC
> >    5306984            -0.7%    5272062            -2.6%    5169631            -5.1%    5034120        turbostat.IRQ
> >     222417 ± 21%     +59.9%     355585 ± 15%     +29.7%     288493 ± 17%     -20.0%     177907 ± 19%  turbostat.POLL
> >       0.02 ± 20%      +0.0        0.04 ± 14%      +0.0        0.03 ± 19%      -0.0        0.02        turbostat.POLL%
> >       0.52 ± 24%     -19.3%       0.42 ± 50%      -7.0%       0.48 ± 17%     -12.4%       0.45 ±  7%  turbostat.Pkg%pc2
> >      40.20            +0.7%      40.50 ±  3%      -0.1%      40.17 ±  3%      +0.5%      40.40 ±  2%  turbostat.PkgTmp
> >      87.87            +0.3%      88.17            +0.4%      88.20            +0.6%      88.40        turbostat.PkgWatt
> >      10.04           +12.4%      11.29           +12.2%      11.26           +12.6%      11.30        turbostat.RAMWatt
> >       3001            -0.0%       3000            -0.0%       3000            -0.0%       3000        turbostat.TSC_MHz
> >     314265            -4.1%     301274            -5.0%     298490            -4.8%     299238        meminfo.Active
> >     312130            -4.2%     299145            -5.1%     296340            -4.8%     297104        meminfo.Active(anon)
> >       2134            -0.3%       2128            +0.7%       2149            -0.0%       2134        meminfo.Active(file)
> >      53077 ±  9%      +0.3%      53222 ±  8%     +10.7%      58778 ±  9%      +5.9%      56198 ± 14%  meminfo.AnonHugePages
> >     304406            -0.3%     303490            +0.1%     304645            +0.1%     304617        meminfo.AnonPages
> >       2051            +0.2%       2055            +1.0%       2072            +0.5%       2061        meminfo.Buffers
> >    3160005            -0.7%    3137936            -0.8%    3134924            -0.8%    3135847        meminfo.Cached
> >   65801604            -0.0%   65801600            -0.0%   65801600            -0.0%   65801600        meminfo.CommitLimit
> >     839115            -2.7%     816130            -3.1%     813419            -3.0%     814330        meminfo.Committed_AS
> >   1.25e+08 ±  2%      +2.1%  1.276e+08            +1.8%  1.272e+08            +1.0%  1.262e+08        meminfo.DirectMap1G
> >    8610611 ± 40%     -30.0%    6030336 ± 23%     -26.0%    6374741 ± 22%     -14.6%    7351910 ± 14%  meminfo.DirectMap2M
> >     308537 ± 17%      -2.0%     302325 ± 16%      -0.4%     307445 ± 10%      +0.1%     308947 ±  9%  meminfo.DirectMap4k
> >      13.00 ± 28%     +12.8%      14.67 ± 30%      +3.8%      13.50 ± 23%     +23.1%      16.00 ±  5%  meminfo.Dirty
> >       2048            +0.0%       2048            +0.0%       2048            +0.0%       2048        meminfo.Hugepagesize
> >     340650            -3.0%     330534            -2.8%     331152            -2.6%     331690        meminfo.Inactive
> >     340463            -3.0%     330348            -2.8%     330961            -2.6%     331497        meminfo.Inactive(anon)
> >     186.60            -0.5%     185.67            +1.9%     190.17 ±  4%      +3.1%     192.40 ±  3%  meminfo.Inactive(file)
> >      95703            -0.3%      95413            -0.2%      95485            -0.4%      95332        meminfo.KReclaimable
> >       9046            +0.2%       9060            -0.1%       9034            -0.3%       9017        meminfo.KernelStack
> >      54598           -16.7%      45490           -16.3%      45704           -16.0%      45866        meminfo.Mapped
> >  1.268e+08            -6.6%  1.184e+08            -6.6%  1.185e+08            -6.6%  1.184e+08        meminfo.MemAvailable
> >  1.276e+08            -6.6%  1.192e+08            -6.5%  1.193e+08            -6.6%  1.193e+08        meminfo.MemFree
> >  1.316e+08            -0.0%  1.316e+08            -0.0%  1.316e+08            -0.0%  1.316e+08        meminfo.MemTotal
> >    3958498          +212.2%   12357945          +211.2%   12317930          +212.1%   12353184        meminfo.Memused
> >      11.00            +0.0%      11.00            +0.0%      11.00            +0.0%      11.00        meminfo.Mlocked
> >       4014            -0.2%       4007            -0.2%       4006            +0.6%       4040        meminfo.PageTables
> >      17796        +48024.2%    8564575        +47827.4%    8529539        +48034.7%    8566438        meminfo.Percpu
> >      95703            -0.3%      95413            -0.2%      95485            -0.4%      95332        meminfo.SReclaimable
> >      91742          +311.6%     377568          +310.0%     376107          +311.2%     377278        meminfo.SUnreclaim
> >     347928            -6.3%     325861            -7.2%     322842            -6.9%     323773        meminfo.Shmem
> >     187447          +152.3%     472983          +151.6%     471592          +152.1%     472612        meminfo.Slab
> >    2811804            +0.0%    2811809            +0.0%    2811810            -0.0%    2811803        meminfo.Unevictable
> >  3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10        meminfo.VmallocTotal
> >      20441         +2173.2%     464664         +2164.2%     462832         +2173.5%     464731        meminfo.VmallocUsed
> >       0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        meminfo.Writeback
> >    4134235          +198.9%   12358013          +198.0%   12317956          +198.8%   12353188        meminfo.max_used_kB
> >     136.40 ± 19%      -2.9%     132.50 ± 17%      -1.0%     135.00 ± 11%      +0.3%     136.80 ± 10%  proc-vmstat.direct_map_level2_splits
> >       5.00 ± 65%     -53.3%       2.33 ± 58%     -46.7%       2.67 ± 51%     -24.0%       3.80 ± 34%  proc-vmstat.direct_map_level3_splits
> >      78032            -4.2%      74786            -5.1%      74084            -4.8%      74275        proc-vmstat.nr_active_anon
> >     533.20            -0.3%     531.83            +0.7%     537.00            +0.0%     533.20        proc-vmstat.nr_active_file
> >      76105            -0.3%      75876            +0.1%      76160            +0.1%      76154        proc-vmstat.nr_anon_pages
> >      25.60 ±  9%      +0.3%      25.67 ±  8%     +10.0%      28.17 ±  9%      +4.7%      26.80 ± 15%  proc-vmstat.nr_anon_transparent_hugepages
> >      10.40 ± 13%      -3.8%      10.00 ± 11%     +69.9%      17.67 ± 68%     -11.5%       9.20 ±  4%  proc-vmstat.nr_dirtied
> >       3.20 ± 30%      +9.4%       3.50 ± 31%      -1.0%       3.17 ± 28%     +12.5%       3.60 ± 13%  proc-vmstat.nr_dirty
> >    3165293            -6.6%    2955608            -6.6%    2956609            -6.6%    2955729        proc-vmstat.nr_dirty_background_threshold
> >    6338326            -6.6%    5918443            -6.6%    5920448            -6.6%    5918685        proc-vmstat.nr_dirty_threshold
> >     790516            -0.7%     785001            -0.8%     784249            -0.8%     784477        proc-vmstat.nr_file_pages
> >   31911204            -6.6%   29811282            -6.5%   29821300            -6.6%   29812487        proc-vmstat.nr_free_pages
> >      85121            -3.0%      82592            -2.8%      82739            -2.6%      82877        proc-vmstat.nr_inactive_anon
> >      46.40            -0.9%      46.00            +1.7%      47.17 ±  4%      +2.6%      47.60 ±  3%  proc-vmstat.nr_inactive_file
> >       9046            +0.2%       9061            -0.1%       9035            -0.3%       9016        proc-vmstat.nr_kernel_stack
> >      13656           -16.7%      11375           -16.3%      11427           -16.0%      11469        proc-vmstat.nr_mapped
> >       2.00            +0.0%       2.00            +0.0%       2.00            +0.0%       2.00        proc-vmstat.nr_mlock
> >       1003            -0.2%       1001            -0.2%       1001            +0.7%       1010        proc-vmstat.nr_page_table_pages
> >      86984            -6.3%      81468            -7.2%      80710            -6.9%      80944        proc-vmstat.nr_shmem
> >      23925            -0.3%      23853            -0.2%      23870            -0.4%      23831        proc-vmstat.nr_slab_reclaimable
> >      22933          +311.6%      94392          +310.0%      94026          +311.3%      94320        proc-vmstat.nr_slab_unreclaimable
> >     702950            +0.0%     702951            +0.0%     702952            -0.0%     702950        proc-vmstat.nr_unevictable
> >       0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.nr_writeback
> >       9.20 ± 15%      -2.2%       9.00 ± 16%      -2.2%       9.00 ± 12%     -10.9%       8.20 ±  4%  proc-vmstat.nr_written
> >      78032            -4.2%      74786            -5.1%      74084            -4.8%      74275        proc-vmstat.nr_zone_active_anon
> >     533.20            -0.3%     531.83            +0.7%     537.00            +0.0%     533.20        proc-vmstat.nr_zone_active_file
> >      85121            -3.0%      82592            -2.8%      82739            -2.6%      82877        proc-vmstat.nr_zone_inactive_anon
> >      46.40            -0.9%      46.00            +1.7%      47.17 ±  4%      +2.6%      47.60 ±  3%  proc-vmstat.nr_zone_inactive_file
> >     702950            +0.0%     702951            +0.0%     702952            -0.0%     702950        proc-vmstat.nr_zone_unevictable
> >       3.00 ± 42%     +11.1%       3.33 ± 28%      -5.6%       2.83 ± 42%     +20.0%       3.60 ± 13%  proc-vmstat.nr_zone_write_pending
> >    1198017          +343.6%    5314240 ±  2%    +341.8%    5292895          +342.8%    5304308        proc-vmstat.numa_hit
> >       0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.numa_interleave
> >    1198053          +343.5%    5313831 ±  2%    +341.3%    5287476          +342.7%    5304308        proc-vmstat.numa_local
> >     119617            -6.2%     112166            -7.2%     111048            -6.8%     111519        proc-vmstat.pgactivate
> >       0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
> >    1872854 ±  3%    +209.6%    5799179 ±  2%    +208.3%    5774057          +207.9%    5767226        proc-vmstat.pgalloc_normal
> >     208042            -1.2%     205567            -1.0%     206000            -0.6%     206729        proc-vmstat.pgfault
> >    1734145 ±  3%     -27.1%    1265016 ±  4%     -26.7%    1270273 ±  2%     -28.4%    1242297 ±  3%  proc-vmstat.pgfree
> >       1008            +0.0%       1008            +0.0%       1008            +0.1%       1008        proc-vmstat.pgpgin
> >      23484 ±  4%      +9.7%      25752 ± 19%     +14.0%      26763 ± 24%      -5.2%      22257 ±  3%  proc-vmstat.pgpgout
> >       7594            +1.8%       7734 ±  3%      -0.6%       7546            +2.2%       7759 ±  2%  proc-vmstat.pgreuse
> >      47.20 ±  3%      -0.1%      47.17 ±  3%      +1.7%      48.00            -0.4%      47.00 ±  4%  proc-vmstat.thp_collapse_alloc
> >       0.20 ±200%     -16.7%       0.17 ±223%     -16.7%       0.17 ±223%      +0.0%       0.20 ±200%  proc-vmstat.thp_deferred_split_page
> >       1.20 ± 97%     -58.3%       0.50 ±100%     +25.0%       1.50 ± 74%      +0.0%       1.20 ± 97%  proc-vmstat.thp_fault_alloc
> >       0.20 ±200%     -16.7%       0.17 ±223%     -16.7%       0.17 ±223%      +0.0%       0.20 ±200%  proc-vmstat.thp_split_pmd
> >       0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_alloc
> >     155.20            +1.1%     156.83            +2.2%     158.67 ±  3%      +2.7%     159.40 ±  2%  proc-vmstat.unevictable_pgs_culled
> >       3.00            +0.0%       3.00            +0.0%       3.00            +0.0%       3.00        proc-vmstat.unevictable_pgs_mlocked
> >       3.00            +0.0%       3.00           -16.7%       2.50 ± 44%      +0.0%       3.00        proc-vmstat.unevictable_pgs_munlocked
> >       3.38           +16.3%       3.93 ±  2%     +15.9%       3.92           +13.9%       3.85        perf-stat.i.MPKI
> >  2.722e+09            -2.8%  2.646e+09            -2.9%  2.642e+09            -1.7%  2.676e+09        perf-stat.i.branch-instructions
> >       1.51            +0.0        1.54            +0.0        1.54            +0.0        1.54        perf-stat.i.branch-miss-rate%
> >   40905304            -0.6%   40670573            -0.9%   40554409            -0.0%   40900878        perf-stat.i.branch-misses
> >       2.80 ±  3%      +9.7       12.51 ±  2%      +9.7       12.54            +9.8       12.61        perf-stat.i.cache-miss-rate%
> >    1279219 ±  2%    +405.4%    6465648          +404.7%    6456091          +408.2%    6501132        perf-stat.i.cache-misses
> >   45100283           +14.9%   51811443 ±  2%     +14.7%   51711839           +14.3%   51548096        perf-stat.i.cache-references
> >     191751            -4.0%     184047            -7.2%     177903 ±  2%     -10.9%     170818        perf-stat.i.context-switches
> >       0.68            +2.0%       0.69            +1.3%       0.69            +0.1%       0.68        perf-stat.i.cpi
> >      36001            +0.0%      36001            +0.0%      36001            -0.0%      36001        perf-stat.i.cpu-clock
> >  9.046e+09            +0.4%   9.08e+09            -0.3%  9.021e+09            -0.0%  9.043e+09        perf-stat.i.cpu-cycles
> >     801.69 ±  3%      +5.5%     845.41 ±  8%      -7.3%     743.06 ± 12%      -5.3%     759.06 ± 12%  perf-stat.i.cpu-migrations
> >      29639 ± 13%     -95.0%       1483           -95.0%       1481           -95.0%       1471        perf-stat.i.cycles-between-cache-misses
> >       0.01 ±  2%      +0.0        0.01 ±  9%      +0.0        0.01 ± 15%      +0.0        0.01 ±  7%  perf-stat.i.dTLB-load-miss-rate%
> >     185154 ±  2%     +40.1%     259332 ±  9%     +38.0%     255444 ± 14%     +24.0%     229505 ±  6%  perf-stat.i.dTLB-load-misses
> >  2.909e+09            -0.2%  2.904e+09            +0.2%  2.915e+09            +1.5%  2.952e+09        perf-stat.i.dTLB-loads
> >       0.01 ±  6%      +0.0        0.01 ±  2%      +0.0        0.01 ±  4%      +0.0        0.01        perf-stat.i.dTLB-store-miss-rate%
> >     100360 ±  6%    +131.3%     232163          +130.1%     230934 ±  3%    +126.1%     226935        perf-stat.i.dTLB-store-misses
> >  1.714e+09            +2.8%  1.761e+09            +3.4%  1.771e+09            +4.7%  1.794e+09        perf-stat.i.dTLB-stores
> >      65.01            -2.2       62.84            -2.1       62.95            -1.8       63.22        perf-stat.i.iTLB-load-miss-rate%
> >    3401759 ±  2%     -10.4%    3046756 ±  2%     -11.2%    3021917 ±  3%     -10.1%    3059770        perf-stat.i.iTLB-load-misses
> >    1811706            -1.4%    1786901 ±  2%      -2.8%    1761199 ±  2%      -2.7%    1762394        perf-stat.i.iTLB-loads
> >  1.333e+10            -1.7%  1.311e+10            -1.6%  1.312e+10            -0.2%  1.331e+10        perf-stat.i.instructions
> >       4008 ±  2%      +9.4%       4386 ±  2%     +10.5%       4427 ±  3%     +10.7%       4438 ±  2%  perf-stat.i.instructions-per-iTLB-miss
> >       1.47            -1.9%       1.44            -1.2%       1.46            -0.1%       1.47        perf-stat.i.ipc
> >       0.07 ± 54%    +324.4%       0.30 ± 24%    +464.6%       0.40 ± 22%    +200.1%       0.21 ± 29%  perf-stat.i.major-faults
> >       0.25            +0.4%       0.25            -0.3%       0.25            -0.0%       0.25        perf-stat.i.metric.GHz
> >      83.36          +105.3%     171.11 ±  8%     +98.1%     165.17 ±  3%     +94.4%     162.07 ±  3%  perf-stat.i.metric.K/sec
> >     205.25            -0.4%     204.51            -0.1%     204.97            +1.1%     207.60        perf-stat.i.metric.M/sec
> >       1821            -1.7%       1789            -1.6%       1792            -0.9%       1804        perf-stat.i.minor-faults
> >     178289 ±  3%     +80.4%     321568 ±  3%     +78.1%     317486 ±  2%     +73.8%     309946 ±  2%  perf-stat.i.node-loads
> >     250794 ±  5%   +1108.3%    3030370 ± 10%   +1026.1%    2824270 ±  6%    +988.8%    2730537 ±  4%  perf-stat.i.node-stores
> >       1821            -1.7%       1789            -1.6%       1792            -0.9%       1804        perf-stat.i.page-faults
> >      36001            +0.0%      36001            +0.0%      36001            -0.0%      36001        perf-stat.i.task-clock
> >       3.38           +16.8%       3.95 ±  2%     +16.5%       3.94           +14.5%       3.87        perf-stat.overall.MPKI
> >       1.50            +0.0        1.54            +0.0        1.53            +0.0        1.53        perf-stat.overall.branch-miss-rate%
> >       2.84 ±  3%      +9.7       12.49 ±  3%      +9.6       12.49            +9.8       12.61        perf-stat.overall.cache-miss-rate%
> >       0.68            +2.1%       0.69            +1.3%       0.69            +0.2%       0.68        perf-stat.overall.cpi
> >       7074 ±  2%     -80.1%       1404           -80.2%       1397           -80.3%       1391        perf-stat.overall.cycles-between-cache-misses
> >       0.01 ±  2%      +0.0        0.01 ±  9%      +0.0        0.01 ± 14%      +0.0        0.01 ±  6%  perf-stat.overall.dTLB-load-miss-rate%
> >       0.01 ±  6%      +0.0        0.01 ±  2%      +0.0        0.01 ±  3%      +0.0        0.01        perf-stat.overall.dTLB-store-miss-rate%
> >      65.24            -2.2       63.03            -2.1       63.16            -1.8       63.45        perf-stat.overall.iTLB-load-miss-rate%
> >       3921 ±  2%      +9.8%       4306 ±  2%     +10.9%       4348 ±  3%     +10.9%       4350        perf-stat.overall.instructions-per-iTLB-miss
> >       1.47            -2.0%       1.44            -1.3%       1.45            -0.2%       1.47        perf-stat.overall.ipc
> >  2.678e+09            -2.8%  2.604e+09            -2.9%    2.6e+09            -1.7%  2.634e+09        perf-stat.ps.branch-instructions
> >   40256213            -0.6%   40026001            -0.9%   39911551            -0.0%   40251975        perf-stat.ps.branch-misses
> >    1259329 ±  2%    +405.3%    6363306          +404.5%    6353871          +408.1%    6398089        perf-stat.ps.cache-misses
> >   44384348           +14.9%   50989645 ±  2%     +14.7%   50891131           +14.3%   50729049        perf-stat.ps.cache-references
> >     188703            -4.0%     181127            -7.2%     175079 ±  2%     -10.9%     168103        perf-stat.ps.context-switches
> >      35429            -0.0%      35429            +0.0%      35430            -0.0%      35429        perf-stat.ps.cpu-clock
> >  8.903e+09            +0.4%  8.936e+09            -0.3%  8.878e+09            -0.0%    8.9e+09        perf-stat.ps.cpu-cycles
> >     788.95 ±  3%      +5.5%     832.00 ±  8%      -7.3%     731.27 ± 12%      -5.3%     746.99 ± 12%  perf-stat.ps.cpu-migrations
> >     182239 ±  2%     +40.1%     255227 ±  9%     +38.0%     251400 ± 14%     +23.9%     225874 ±  6%  perf-stat.ps.dTLB-load-misses
> >  2.863e+09            -0.2%  2.858e+09            +0.2%  2.869e+09            +1.5%  2.905e+09        perf-stat.ps.dTLB-loads
> >      98768 ±  6%    +131.3%     228477          +130.1%     227267 ±  3%    +126.1%     223327        perf-stat.ps.dTLB-store-misses
> >  1.686e+09            +2.8%  1.733e+09            +3.4%  1.743e+09            +4.7%  1.766e+09        perf-stat.ps.dTLB-stores
> >    3347701 ±  2%     -10.4%    2998429 ±  2%     -11.2%    2973969 ±  3%     -10.1%    3011153        perf-stat.ps.iTLB-load-misses
> >    1782901            -1.4%    1758532 ±  2%      -2.8%    1733226 ±  2%      -2.7%    1734372        perf-stat.ps.iTLB-loads
> >  1.312e+10            -1.6%  1.291e+10            -1.6%  1.291e+10            -0.2%   1.31e+10        perf-stat.ps.instructions
> >       0.07 ± 54%    +324.2%       0.30 ± 24%    +464.4%       0.39 ± 22%    +200.0%       0.21 ± 29%  perf-stat.ps.major-faults
> >       1792            -1.8%       1760            -1.6%       1764            -0.9%       1776        perf-stat.ps.minor-faults
> >     175514 ±  3%     +80.3%     316505 ±  3%     +78.0%     312489 ±  2%     +73.8%     305064 ±  2%  perf-stat.ps.node-loads
> >     246889 ±  5%   +1108.0%    2982338 ± 10%   +1025.8%    2779488 ±  6%    +988.4%    2687177 ±  4%  perf-stat.ps.node-stores
> >       1792            -1.7%       1761            -1.6%       1764            -0.9%       1776        perf-stat.ps.page-faults
> >      35429            -0.0%      35429            +0.0%      35430            -0.0%      35429        perf-stat.ps.task-clock
> >  8.277e+11            -1.6%  8.141e+11            -1.6%  8.146e+11            -0.2%  8.262e+11        perf-stat.total.instructions
> >       2891            +0.2%       2897            +0.0%       2892            +0.1%       2894        softirqs.BLOCK
> >      99.40            +0.4%      99.83            -0.9%      98.50            +0.0%      99.40        softirqs.HI
> >      68.40 ±  3%      +0.1%      68.50            +0.4%      68.67 ±  2%      +3.2%      70.60 ±  2%  softirqs.NET_RX
> >       4.00            +0.0%       4.00            +0.0%       4.00            +0.0%       4.00        softirqs.NET_TX
> >     705640 ±  4%     +37.2%     968304 ± 28%     +16.5%     822138 ± 31%      +9.5%     772471 ± 49%  softirqs.RCU
> >     326452 ±  3%      +2.2%     333791            +1.6%     331596 ±  5%      -2.5%     318406 ±  4%  softirqs.SCHED
> >     580.40            +0.8%     585.17            +0.5%     583.17            +0.7%     584.40        softirqs.TASKLET
> >      16668 ±  2%      +0.7%      16789            -0.5%      16592 ±  3%      -0.6%      16567 ±  4%  softirqs.TIMER
> >    1797799           -11.6%    1589634           -13.0%    1563259 ±  2%     -13.5%    1554661        interrupts.CAL:Function_call_interrupts
> >     245.40            -4.8%     233.67            -5.7%     231.33            -5.6%     231.60        interrupts.IWI:IRQ_work_interrupts
> >    3191028            -0.1%    3187387            -0.1%    3187700            -0.2%    3185238        interrupts.LOC:Local_timer_interrupts
> >       0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        interrupts.MCP:Machine_check_polls
> >      63377 ±  2%      +9.3%      69282 ±  4%      +5.0%      66568 ±  5%      +3.8%      65768 ±  6%  interrupts.NMI:Non-maskable_interrupts
> >      63377 ±  2%      +9.3%      69282 ±  4%      +5.0%      66568 ±  5%      +3.8%      65768 ±  6%  interrupts.PMI:Performance_monitoring_interrupts
> >     193638 ± 24%     +85.7%     359502 ± 18%     +48.7%     287850 ± 21%     -14.6%     165355 ± 24%  interrupts.RES:Rescheduling_interrupts
> >       0.00          -100.0%       0.00          -100.0%       0.00          -100.0%       0.00        interrupts.RTR:APIC_ICR_read_retries
> >     314.80 ±  6%     -12.5%     275.50 ±  7%     -14.9%     267.83 ±  5%     -14.7%     268.40 ±  9%  interrupts.TLB:TLB_shootdowns
> >       0.00            +0.0%       0.00            +0.0%       0.00            +0.0%       0.00        perf-sched.total_sch_delay.average.ms
> >       1.37 ± 33%     -35.2%       0.89 ± 41%      +4.8%       1.44 ± 72%     -36.2%       0.88 ± 34%  perf-sched.total_sch_delay.max.ms
> >       0.86 ±  4%      +5.5%       0.90            +8.1%       0.92 ±  2%      +7.4%       0.92        perf-sched.total_wait_and_delay.average.ms
> >     629234            -7.2%     584017            -7.8%     580183            -7.4%     582793 ±  2%  perf-sched.total_wait_and_delay.count.ms
> >       4101 ± 10%      -9.9%       3696 ± 11%     -12.1%       3604 ± 24%     -12.7%       3579 ± 27%  perf-sched.total_wait_and_delay.max.ms
> >       0.85 ±  4%      +5.6%       0.90            +8.1%       0.92 ±  2%      +7.4%       0.92        perf-sched.total_wait_time.average.ms
> >       4101 ± 10%      -9.9%       3696 ± 11%     -12.1%       3604 ± 24%     -12.7%       3579 ± 27%  perf-sched.total_wait_time.max.ms
> >      42.15 ± 23%      -6.7       35.41 ±  9%      -8.5       33.69 ± 11%      -9.4       32.80 ±  8%  perf-profile.calltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
> >      42.15 ± 23%      -6.7       35.41 ±  9%      -8.5       33.69 ± 11%      -9.4       32.80 ±  8%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
> >      42.13 ± 23%      -6.7       35.40 ±  9%      -8.5       33.67 ± 11%      -9.4       32.78 ±  8%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
> >      41.50 ± 23%      -6.7       34.82 ±  9%      -8.4       33.10 ± 11%      -9.3       32.24 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
> >      42.92 ± 22%      -6.6       36.33 ±  8%      -8.2       34.69 ± 10%      -9.0       33.89 ±  8%  perf-profile.calltrace.cycles-pp.secondary_startup_64_no_verify
> >      40.93 ± 24%      -6.6       34.35 ±  9%      -8.4       32.52 ± 11%      -9.3       31.68 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
> >      41.24 ± 23%      -6.5       34.76 ±  9%      -8.2       33.00 ± 11%      -8.9       32.35 ±  8%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
> >      36.93 ± 26%      -6.2       30.72 ± 10%      -8.2       28.69 ± 12%      -8.6       28.30 ±  8%  perf-profile.calltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
> >       3.27 ± 14%      -0.5        2.76 ± 12%      -0.2        3.04 ± 23%      -0.6        2.65 ± 13%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
> >       2.96 ± 14%      -0.4        2.51 ± 13%      -0.2        2.75 ± 23%      -0.6        2.40 ± 14%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
> >       2.24 ± 11%      -0.3        1.92 ±  9%      -0.1        2.16 ± 20%      -0.5        1.77 ± 11%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> >       2.22 ± 11%      -0.3        1.90 ±  9%      -0.1        2.14 ± 20%      -0.5        1.75 ± 11%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
> >       0.48 ± 51%      -0.3        0.18 ±141%      -0.4        0.09 ±223%      -0.4        0.12 ±200%  perf-profile.calltrace.cycles-pp.__xstat64
> >       1.46 ± 15%      -0.3        1.20 ± 19%      +0.0        1.50 ± 25%      -0.2        1.27 ± 20%  perf-profile.calltrace.cycles-pp.clock_nanosleep
> >       1.84 ± 12%      -0.3        1.58 ±  8%      -0.1        1.73 ± 21%      -0.4        1.39 ± 10%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
> >       0.44 ± 50%      -0.3        0.18 ±141%      -0.4        0.08 ±223%      -0.4        0.00        perf-profile.calltrace.cycles-pp.alloc_empty_file.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
> >       1.30 ± 15%      -0.2        1.06 ± 19%      +0.0        1.33 ± 25%      -0.2        1.14 ± 21%  perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> >       1.28 ± 15%      -0.2        1.04 ± 19%      +0.0        1.31 ± 25%      -0.2        1.13 ± 21%  perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
> >       1.30 ± 15%      -0.2        1.06 ± 19%      +0.0        1.33 ± 25%      -0.2        1.14 ± 21%  perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       1.36 ± 15%      -0.2        1.12 ± 19%      +0.0        1.40 ± 25%      -0.2        1.19 ± 21%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> >       1.34 ± 14%      -0.2        1.10 ± 19%      +0.0        1.37 ± 25%      -0.2        1.17 ± 21%  perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> >       1.36 ± 15%      -0.2        1.13 ± 19%      +0.0        1.41 ± 25%      -0.2        1.21 ± 21%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> >       1.17 ± 30%      -0.2        0.94 ± 16%      -0.2        0.96 ± 18%      -0.2        0.99 ± 11%  perf-profile.calltrace.cycles-pp.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super.vfs_get_tree
> >       0.23 ±122%      -0.2        0.00            -0.0        0.18 ±141%      -0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
> >       0.22 ±123%      -0.2        0.00            -0.1        0.08 ±223%      +0.0        0.23 ±122%  perf-profile.calltrace.cycles-pp.ramfs_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
> >       1.17 ± 16%      -0.2        0.95 ± 20%      +0.0        1.19 ± 24%      -0.1        1.05 ± 20%  perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
> >       1.07 ± 30%      -0.2        0.86 ± 17%      -0.2        0.88 ± 17%      -0.2        0.91 ± 12%  perf-profile.calltrace.cycles-pp.pcpu_alloc.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super
> >       1.16 ± 16%      -0.2        0.94 ± 21%      +0.0        1.18 ± 24%      -0.1        1.04 ± 20%  perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
> >       1.36 ± 14%      -0.2        1.16 ± 10%      -0.1        1.28 ± 21%      -0.3        1.04 ±  9%  perf-profile.calltrace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
> >       0.83 ± 16%      -0.2        0.64 ± 48%      -0.0        0.82 ± 47%      -0.2        0.67 ± 51%  perf-profile.calltrace.cycles-pp.load_balance.newidle_balance.pick_next_task_fair.__schedule.schedule
> >       1.25 ± 12%      -0.2        1.07 ± 11%      -0.1        1.18 ± 19%      -0.3        0.99 ±  9%  perf-profile.calltrace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
> >       0.66 ± 10%      -0.2        0.48 ± 46%      -0.1        0.56 ± 46%      -0.1        0.59 ±  9%  perf-profile.calltrace.cycles-pp.perf_adjust_freq_unthr_context.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_handle
> >       0.78 ± 16%      -0.2        0.60 ± 48%      -0.0        0.76 ± 47%      -0.2        0.62 ± 52%  perf-profile.calltrace.cycles-pp.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair.__schedule
> >       1.24 ± 11%      -0.2        1.06 ± 11%      -0.1        1.16 ± 19%      -0.3        0.98 ±  9%  perf-profile.calltrace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt
> >       0.76 ± 16%      -0.2        0.58 ± 48%      -0.0        0.74 ± 47%      -0.2        0.61 ± 52%  perf-profile.calltrace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance.pick_next_task_fair
> >       0.96 ± 16%      -0.2        0.81 ± 20%      +0.0        1.00 ± 27%      -0.1        0.88 ± 22%  perf-profile.calltrace.cycles-pp.pick_next_task_fair.__schedule.schedule.do_nanosleep.hrtimer_nanosleep
> >       0.95 ± 16%      -0.2        0.80 ± 20%      -0.0        0.90 ± 47%      -0.1        0.88 ± 22%  perf-profile.calltrace.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.do_nanosleep
> >       0.69 ± 16%      -0.1        0.54 ± 49%      -0.0        0.67 ± 47%      -0.1        0.56 ± 52%  perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance
> >       0.98 ± 10%      -0.1        0.84 ±  9%      -0.1        0.93 ± 16%      -0.2        0.82 ±  9%  perf-profile.calltrace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues
> >       0.22 ±122%      -0.1        0.09 ±223%      -0.1        0.10 ±223%      -0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath.sd_device_new_from_syspath
> >       1.20 ± 23%      -0.1        1.07 ± 16%      -0.1        1.14 ±  6%      +0.0        1.24 ± 16%  perf-profile.calltrace.cycles-pp.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one
> >       0.23 ±123%      -0.1        0.10 ±223%      -0.2        0.00            -0.2        0.00        perf-profile.calltrace.cycles-pp.strcmp@plt
> >       0.22 ±122%      -0.1        0.08 ±223%      -0.1        0.09 ±223%      -0.1        0.10 ±200%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath.sd_device_new_from_syspath
> >       3.33 ± 25%      -0.1        3.20 ± 10%      +0.1        3.45 ± 11%      +0.2        3.57 ±  9%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> >       3.35 ± 24%      -0.1        3.22 ± 10%      +0.1        3.46 ± 11%      +0.2        3.58 ±  9%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> >       0.21 ±122%      -0.1        0.08 ±223%      -0.2        0.00            -0.1        0.10 ±200%  perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
> >       0.22 ±122%      -0.1        0.09 ±223%      -0.0        0.18 ±141%      +0.1        0.35 ± 81%  perf-profile.calltrace.cycles-pp.ramfs_symlink.vfs_symlink.do_symlinkat.__x64_sys_symlink.do_syscall_64
> >       0.13 ±200%      -0.1        0.00            -0.0        0.08 ±223%      -0.1        0.00        perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newlstat
> >       0.32 ± 81%      -0.1        0.19 ±141%      -0.2        0.09 ±223%      -0.3        0.00        perf-profile.calltrace.cycles-pp.vsnprintf.seq_printf.show_mountinfo.seq_read_iter.vfs_read
> >       3.07 ± 25%      -0.1        2.95 ± 10%      +0.1        3.19 ± 11%      +0.2        3.29 ±  9%  perf-profile.calltrace.cycles-pp.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
> >       4.13 ± 22%      -0.1        4.02 ±  8%      +0.1        4.26 ±  9%      +0.2        4.37 ±  7%  perf-profile.calltrace.cycles-pp.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
> >       4.25 ± 21%      -0.1        4.14 ±  8%      +0.1        4.38 ±  8%      +0.3        4.50 ±  7%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.11 ±200%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.__fxstat64
> >       0.11 ±200%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.do_open.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
> >       0.11 ±200%      -0.1        0.00            -0.1        0.00            -0.0        0.10 ±200%  perf-profile.calltrace.cycles-pp.memset_orig.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree
> >       0.11 ±200%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.filename_create.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.10 ±200%      -0.1        0.00            -0.0        0.10 ±223%      -0.1        0.00        perf-profile.calltrace.cycles-pp.schedule.schedule_timeout.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus
> >       0.10 ±200%      -0.1        0.00            -0.1        0.00            -0.1        0.00        perf-profile.calltrace.cycles-pp.__do_sys_newfstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__fxstat64.device_set_syspath
> >       0.68 ± 10%      -0.1        0.58 ± 11%      -0.1        0.58 ± 46%      -0.1        0.61 ±  9%  perf-profile.calltrace.cycles-pp.perf_event_task_tick.scheduler_tick.update_process_times.tick_sched_handle.tick_sched_timer
> >       9.18 ± 25%      -0.1        9.10 ± 12%      +0.4        9.63 ± 11%      +0.7        9.89 ± 10%  perf-profile.calltrace.cycles-pp.umount2
> >       0.36 ± 82%      -0.1        0.28 ±100%      -0.1        0.30 ±100%      -0.0        0.34 ± 81%  perf-profile.calltrace.cycles-pp.__sync_rcu_exp_select_node_cpus.process_one_work.worker_thread.kthread.ret_from_fork
> >       1.82 ± 24%      -0.1        1.75 ± 16%      -0.0        1.81 ±  9%      +0.1        1.95 ± 16%  perf-profile.calltrace.cycles-pp.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one.propagate_mnt
> >       8.78 ± 25%      -0.1        8.71 ± 12%      +0.4        9.22 ± 11%      +0.7        9.47 ± 10%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> >       8.82 ± 25%      -0.1        8.75 ± 12%      +0.4        9.26 ± 11%      +0.7        9.52 ± 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.umount2
> >       0.37 ± 81%      -0.1        0.30 ±101%      +0.0        0.39 ± 73%      -0.0        0.36 ± 82%  perf-profile.calltrace.cycles-pp.alloc_vfsmnt.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64
> >       0.24 ±122%      -0.1        0.18 ±141%      -0.2        0.00            -0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__xstat64
> >       0.24 ±122%      -0.1        0.18 ±141%      -0.2        0.00            -0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
> >       0.24 ±122%      -0.1        0.17 ±141%      -0.2        0.00            -0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.__do_sys_newstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__xstat64
> >       0.33 ± 81%      -0.1        0.26 ±100%      +0.1        0.40 ± 71%      -0.1        0.22 ±122%  perf-profile.calltrace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
> >       0.36 ± 83%      -0.1        0.30 ±100%      +0.1        0.46 ± 46%      -0.0        0.35 ± 81%  perf-profile.calltrace.cycles-pp.umount_tree.do_umount.path_umount.__x64_sys_umount.do_syscall_64
> >       0.15 ±199%      -0.1        0.10 ±223%      -0.0        0.13 ±223%      +0.1        0.22 ±122%  perf-profile.calltrace.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
> >       0.14 ±200%      -0.1        0.09 ±223%      -0.0        0.13 ±223%      +0.1        0.21 ±122%  perf-profile.calltrace.cycles-pp.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
> >       0.33 ± 82%      -0.1        0.28 ±100%      -0.1        0.28 ±100%      -0.3        0.00        perf-profile.calltrace.cycles-pp.path_compare
> >       0.35 ± 81%      -0.0        0.30 ±100%      -0.3        0.10 ±223%      -0.3        0.00        perf-profile.calltrace.cycles-pp.seq_printf.show_mountinfo.seq_read_iter.vfs_read.ksys_read
> >       1.89 ± 25%      -0.0        1.84 ±  9%      -0.0        1.85 ± 13%      -0.1        1.76 ± 11%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath
> >       1.87 ± 25%      -0.0        1.83 ±  9%      -0.0        1.84 ± 12%      -0.1        1.74 ± 10%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64
> >       0.93 ± 23%      -0.0        0.89 ± 18%      +0.0        0.93 ± 17%      +0.1        0.99 ± 12%  perf-profile.calltrace.cycles-pp.mntput_no_expire.namespace_unlock.do_umount.path_umount.__x64_sys_umount
> >       1.94 ± 25%      -0.0        1.90 ±  9%      -0.0        1.90 ± 13%      -0.1        1.81 ± 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath.sd_device_new_from_syspath
> >       2.09 ± 24%      -0.0        2.05 ± 15%      +0.1        2.14 ±  8%      +0.2        2.26 ± 14%  perf-profile.calltrace.cycles-pp.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount
> >       2.14 ± 23%      -0.0        2.10 ± 16%      +0.1        2.20 ±  8%      +0.2        2.34 ± 15%  perf-profile.calltrace.cycles-pp.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount
> >       2.06 ± 23%      -0.0        2.02 ± 15%      +0.1        2.12 ±  8%      +0.2        2.24 ± 15%  perf-profile.calltrace.cycles-pp.clone_mnt.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt
> >       1.92 ± 25%      -0.0        1.88 ±  9%      -0.0        1.89 ± 13%      -0.1        1.80 ± 10%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.openat64.device_set_syspath.sd_device_new_from_syspath
> >       0.59 ± 52%      -0.0        0.56 ± 48%      +0.1        0.68 ± 17%      +0.1        0.73 ± 10%  perf-profile.calltrace.cycles-pp.mnt_get_count.mntput_no_expire.namespace_unlock.do_umount.path_umount
> >       0.82 ± 26%      -0.0        0.79 ±  6%      +0.1        0.87 ± 14%      +0.1        0.88 ±  9%  perf-profile.calltrace.cycles-pp.kill_litter_super.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop
> >       2.20 ± 24%      -0.0        2.17 ± 16%      +0.1        2.26 ±  8%      +0.2        2.39 ± 15%  perf-profile.calltrace.cycles-pp.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64
> >       0.78 ± 27%      -0.0        0.76 ± 19%      +0.0        0.79 ± 14%      +0.0        0.83 ± 13%  perf-profile.calltrace.cycles-pp.srcu_advance_state.process_srcu.process_one_work.worker_thread.kthread
> >       0.11 ±200%      -0.0        0.09 ±223%      -0.0        0.11 ±223%      -0.0        0.10 ±200%  perf-profile.calltrace.cycles-pp.schedule_timeout.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp
> >       2.07 ± 25%      -0.0        2.05 ±  9%      -0.0        2.04 ± 13%      -0.1        1.96 ± 10%  perf-profile.calltrace.cycles-pp.openat64.device_set_syspath.sd_device_new_from_syspath
> >       0.97 ± 22%      -0.0        0.96 ±  8%      +0.0        1.00 ±  5%      -0.0        0.97 ±  7%  perf-profile.calltrace.cycles-pp.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
> >       0.37 ± 82%      -0.0        0.36 ± 70%      -0.4        0.00            -0.0        0.33 ± 81%  perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.user_path_at_empty.__x64_sys_umount.do_syscall_64
> >       0.66 ± 54%      -0.0        0.66 ± 12%      +0.0        0.71 ± 15%      +0.1        0.71 ±  8%  perf-profile.calltrace.cycles-pp.mnt_get_writers.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
> >       0.00            +0.0        0.00            +0.0        0.00            +0.1        0.10 ±200%  perf-profile.calltrace.cycles-pp.__filename_parentat.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.00            +0.0        0.00            +0.1        0.08 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.__wait_for_common.__synchronize_srcu.unregister_shrinker.deactivate_locked_super.cleanup_mnt
> >       0.00            +0.0        0.00            +0.1        0.09 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.path_lookupat.filename_lookup.user_path_at_empty.do_readlinkat.__x64_sys_readlinkat
> >       0.00            +0.0        0.00            +0.1        0.09 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.filename_lookup.user_path_at_empty.do_readlinkat.__x64_sys_readlinkat.do_syscall_64
> >       0.00            +0.0        0.00            +0.1        0.10 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.evict.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.00            +0.0        0.00            +0.1        0.10 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.user_path_at_empty.do_readlinkat.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.99 ± 23%      +0.0        1.00 ±  8%      +0.0        1.03 ±  6%      -0.0        0.99 ±  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
> >       1.00 ± 23%      +0.0        1.01 ±  8%      +0.0        1.04 ±  6%      -0.0        1.00 ±  6%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__lxstat64
> >       3.68 ± 16%      +0.0        3.68 ±  4%      +0.0        3.72 ±  9%      -0.1        3.60 ±  2%  perf-profile.calltrace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64
> >       1.85 ± 23%      +0.0        1.86 ± 10%      -0.2        1.69 ± 12%      -0.1        1.74 ±  8%  perf-profile.calltrace.cycles-pp.show_mountinfo.seq_read_iter.vfs_read.ksys_read.do_syscall_64
> >       0.65 ± 23%      +0.0        0.66 ±  5%      +0.0        0.67 ±  8%      +0.0        0.68 ±  6%  perf-profile.calltrace.cycles-pp.__fput.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode
> >       0.41 ± 81%      +0.0        0.42 ± 72%      +0.1        0.52 ± 48%      +0.1        0.51 ± 51%  perf-profile.calltrace.cycles-pp.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.84 ± 22%      +0.0        0.85 ±  9%      +0.0        0.86 ±  6%      -0.0        0.84 ±  7%  perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
> >       3.77 ± 16%      +0.0        3.78 ±  4%      +0.0        3.82 ±  9%      -0.1        3.68 ±  2%  perf-profile.calltrace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.36 ± 81%      +0.0        0.36 ± 71%      -0.1        0.28 ±100%      -0.2        0.21 ±122%  perf-profile.calltrace.cycles-pp.rdrand
> >       0.99 ± 18%      +0.0        1.00 ±  4%      +0.0        1.00 ±  8%      -0.0        0.98 ±  6%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
> >       1.10 ± 25%      +0.0        1.11 ±  9%      +0.0        1.13 ±  6%      +0.0        1.10 ±  7%  perf-profile.calltrace.cycles-pp.__lxstat64
> >       1.64 ± 24%      +0.0        1.66 ± 13%      +0.1        1.72 ±  8%      +0.1        1.75 ± 12%  perf-profile.calltrace.cycles-pp.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> >       0.98 ± 18%      +0.0        1.00 ±  4%      +0.0        0.99 ±  8%      -0.0        0.97 ±  6%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
> >       1.41 ± 23%      +0.0        1.42 ±  7%      -0.1        1.33 ± 14%      -0.1        1.31 ±  7%  perf-profile.calltrace.cycles-pp.siphash24_compress
> >       1.99 ± 24%      +0.0        2.00 ± 10%      +0.2        2.15 ± 10%      +0.2        2.23 ± 10%  perf-profile.calltrace.cycles-pp.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
> >       0.83 ± 25%      +0.0        0.85 ± 18%      +0.2        0.98 ± 10%      +0.1        0.93 ± 13%  perf-profile.calltrace.cycles-pp.strncpy_from_user.getname_flags.user_path_at_empty.__x64_sys_umount.do_syscall_64
> >       2.53 ± 25%      +0.0        2.56 ± 15%      +0.1        2.65 ± 10%      +0.3        2.81 ± 13%  perf-profile.calltrace.cycles-pp.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       1.72 ± 23%      +0.0        1.75 ± 16%      +0.1        1.78 ± 13%      +0.1        1.84 ± 11%  perf-profile.calltrace.cycles-pp.namespace_unlock.do_umount.path_umount.__x64_sys_umount.do_syscall_64
> >       1.00 ± 24%      +0.0        1.03 ± 18%      +0.1        1.15 ±  9%      +0.1        1.11 ± 14%  perf-profile.calltrace.cycles-pp.getname_flags.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.15 ±200%      +0.0        0.18 ±142%      -0.0        0.14 ±223%      +0.1        0.22 ±122%  perf-profile.calltrace.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
> >       0.70 ± 50%      +0.0        0.74 ± 13%      +0.1        0.77 ± 14%      +0.1        0.76 ± 16%  perf-profile.calltrace.cycles-pp.path_lookupat.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
> >       3.72 ± 26%      +0.0        3.76 ± 14%      +0.2        3.93 ± 13%      +0.3        4.04 ± 11%  perf-profile.calltrace.cycles-pp.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> >       0.23 ±122%      +0.0        0.27 ±100%      +0.1        0.29 ±100%      -0.0        0.22 ±122%  perf-profile.calltrace.cycles-pp.do_lock_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       3.33 ± 26%      +0.0        3.38 ± 15%      +0.2        3.55 ± 13%      +0.3        3.63 ± 11%  perf-profile.calltrace.cycles-pp.do_umount.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       2.39 ± 23%      +0.0        2.44 ±  9%      -0.1        2.25 ± 13%      -0.1        2.31 ±  9%  perf-profile.calltrace.cycles-pp.seq_read_iter.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       1.59 ± 32%      +0.1        1.64 ± 11%      +0.1        1.70 ± 12%      +0.2        1.75 ± 12%  perf-profile.calltrace.cycles-pp.unlink
> >       0.88 ± 25%      +0.1        0.93 ± 15%      +0.1        0.93 ± 11%      +0.1        0.96 ± 13%  perf-profile.calltrace.cycles-pp.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.worker_thread.kthread
> >       2.58 ± 24%      +0.1        2.64 ±  9%      -0.1        2.46 ± 13%      -0.1        2.47 ±  8%  perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
> >       0.25 ±125%      +0.1        0.31 ±100%      +0.0        0.30 ±103%      +0.1        0.35 ± 81%  perf-profile.calltrace.cycles-pp.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.worker_thread
> >       0.88 ± 25%      +0.1        0.94 ± 16%      +0.1        0.94 ± 12%      +0.1        0.97 ± 13%  perf-profile.calltrace.cycles-pp.wait_rcu_exp_gp.process_one_work.worker_thread.kthread.ret_from_fork
> >       2.80 ± 25%      +0.1        2.86 ±  8%      -0.0        2.79 ± 13%      -0.1        2.73 ±  9%  perf-profile.calltrace.cycles-pp.device_set_syspath.sd_device_new_from_syspath
> >       0.87 ± 28%      +0.1        0.93 ± 15%      +0.1        0.96 ± 17%      +0.1        1.00 ± 13%  perf-profile.calltrace.cycles-pp.process_srcu.process_one_work.worker_thread.kthread.ret_from_fork
> >       5.39 ± 26%      +0.1        5.45 ± 14%      +0.3        5.71 ± 11%      +0.4        5.83 ± 11%  perf-profile.calltrace.cycles-pp.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> >       2.60 ± 24%      +0.1        2.66 ±  9%      -0.1        2.49 ± 13%      -0.1        2.48 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
> >       2.56 ± 24%      +0.1        2.63 ±  9%      -0.1        2.44 ± 13%      -0.1        2.45 ±  8%  perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.read
> >       2.60 ± 24%      +0.1        2.67 ±  9%      -0.1        2.50 ± 13%      -0.1        2.49 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.read
> >       2.48 ± 28%      +0.1        2.54 ± 12%      +0.2        2.64 ± 15%      +0.3        2.77 ± 10%  perf-profile.calltrace.cycles-pp.stress_rndstr
> >       0.58 ± 54%      +0.1        0.65 ± 50%      +0.2        0.75 ± 46%      +0.3        0.90 ± 26%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init
> >       1.23 ± 18%      +0.1        1.30 ±  4%      +0.1        1.30 ±  8%      +0.0        1.27 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__close
> >       0.12 ±200%      +0.1        0.18 ±141%      -0.0        0.12 ±223%      -0.0        0.11 ±200%  perf-profile.calltrace.cycles-pp.__wait_for_common.__flush_work.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work
> >       2.76 ± 17%      +0.1        2.83 ±  7%      +0.1        2.88 ±  8%      +0.1        2.85 ±  5%  perf-profile.calltrace.cycles-pp.open64
> >       1.34 ± 31%      +0.1        1.41 ± 11%      +0.1        1.46 ± 13%      +0.2        1.50 ± 12%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
> >       1.52 ± 32%      +0.1        1.59 ± 12%      +0.1        1.64 ± 12%      +0.2        1.68 ± 12%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
> >       1.20 ± 18%      +0.1        1.28 ±  4%      +0.1        1.27 ±  8%      +0.1        1.25 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__close
> >       1.50 ± 32%      +0.1        1.57 ± 12%      +0.1        1.63 ± 12%      +0.2        1.67 ± 13%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
> >       0.62 ± 55%      +0.1        0.69 ± 20%      +0.1        0.72 ± 16%      +0.1        0.75 ± 13%  perf-profile.calltrace.cycles-pp.try_check_zero.srcu_advance_state.process_srcu.process_one_work.worker_thread
> >       0.68 ± 54%      +0.1        0.75 ±  6%      +0.2        0.84 ± 14%      +0.2        0.84 ±  9%  perf-profile.calltrace.cycles-pp.generic_shutdown_super.kill_litter_super.deactivate_locked_super.cleanup_mnt.task_work_run
> >       0.42 ± 82%      +0.1        0.50 ± 44%      -0.1        0.37 ± 70%      +0.2        0.58 ±  9%  perf-profile.calltrace.cycles-pp.filename_lookup.user_path_at_empty.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.72 ± 24%      +0.1        0.80 ± 10%      +0.1        0.79 ±  8%      +0.1        0.81 ± 11%  perf-profile.calltrace.cycles-pp.__schedule.schedule.worker_thread.kthread.ret_from_fork
> >       0.10 ±200%      +0.1        0.18 ±141%      +0.2        0.34 ± 70%      +0.2        0.27 ±126%  perf-profile.calltrace.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
> >       0.53 ± 82%      +0.1        0.61 ± 47%      +0.2        0.74 ± 19%      +0.2        0.75 ± 12%  perf-profile.calltrace.cycles-pp.shmem_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
> >       0.00            +0.1        0.08 ±223%      +0.0        0.00            +0.1        0.11 ±200%  perf-profile.calltrace.cycles-pp.__slab_free.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
> >       0.47 ± 50%      +0.1        0.56 ±  9%      -0.1        0.38 ± 71%      -0.1        0.34 ± 82%  perf-profile.calltrace.cycles-pp.device_read_db_internal_filename
> >       2.65 ± 24%      +0.1        2.73 ±  9%      -0.1        2.55 ± 13%      -0.1        2.53 ±  7%  perf-profile.calltrace.cycles-pp.read
> >       1.47 ± 32%      +0.1        1.56 ± 12%      +0.1        1.62 ± 12%      +0.2        1.65 ± 12%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
> >       0.69 ± 55%      +0.1        0.78 ± 11%      +0.2        0.86 ± 13%      +0.2        0.89 ± 12%  perf-profile.calltrace.cycles-pp.propagate_mount_busy.do_umount.path_umount.__x64_sys_umount.do_syscall_64
> >       1.29 ± 31%      +0.1        1.38 ±  8%      +0.0        1.30 ± 12%      +0.0        1.32 ± 12%  perf-profile.calltrace.cycles-pp.malloc
> >       2.65 ± 17%      +0.1        2.74 ±  7%      +0.1        2.78 ±  8%      +0.1        2.75 ±  4%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
> >       1.10 ± 29%      +0.1        1.19 ± 10%      +0.1        1.16 ±  9%      +0.1        1.19 ± 14%  perf-profile.calltrace.cycles-pp.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
> >       3.15 ± 24%      +0.1        3.24 ±  8%      +0.0        3.15 ± 13%      -0.1        3.08 ±  9%  perf-profile.calltrace.cycles-pp.sd_device_new_from_syspath
> >       2.63 ± 16%      +0.1        2.73 ±  6%      +0.1        2.76 ±  8%      +0.1        2.73 ±  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
> >       0.77 ± 23%      +0.1        0.86 ± 10%      +0.1        0.84 ±  7%      +0.1        0.86 ± 11%  perf-profile.calltrace.cycles-pp.schedule.worker_thread.kthread.ret_from_fork
> >       2.59 ± 16%      +0.1        2.69 ±  6%      +0.1        2.72 ±  9%      +0.1        2.69 ±  4%  perf-profile.calltrace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
> >       2.57 ± 16%      +0.1        2.68 ±  6%      +0.1        2.70 ±  9%      +0.1        2.67 ±  4%  perf-profile.calltrace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
> >       0.56 ± 53%      +0.1        0.67 ±  9%      +0.1        0.68 ±  6%      +0.1        0.64 ±  6%  perf-profile.calltrace.cycles-pp.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       1.42 ± 17%      +0.1        1.53 ±  4%      +0.1        1.50 ±  9%      +0.0        1.44 ±  7%  perf-profile.calltrace.cycles-pp.__close
> >       0.00            +0.1        0.11 ±223%      +0.1        0.12 ±223%      +0.0        0.00        perf-profile.calltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
> >       1.24 ± 29%      +0.1        1.36 ± 11%      +0.1        1.30 ± 10%      +0.1        1.35 ± 14%  perf-profile.calltrace.cycles-pp.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
> >       1.26 ± 28%      +0.1        1.38 ± 11%      +0.1        1.33 ±  9%      +0.1        1.36 ± 13%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.symlink
> >       0.64 ± 54%      +0.1        0.76 ± 11%      +0.2        0.82 ± 12%      +0.1        0.79 ± 12%  perf-profile.calltrace.cycles-pp.__x64_sys_mkdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
> >       1.26 ± 29%      +0.1        1.38 ± 11%      +0.1        1.32 ±  9%      +0.1        1.36 ± 13%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.symlink
> >       0.13 ±200%      +0.1        0.26 ±100%      +0.2        0.35 ± 70%      +0.1        0.21 ±122%  perf-profile.calltrace.cycles-pp.filename_lookup.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64
> >       0.66 ± 53%      +0.1        0.78 ± 16%      +0.1        0.76 ± 16%      +0.2        0.81 ± 13%  perf-profile.calltrace.cycles-pp.stress_mwc32
> >       0.65 ± 54%      +0.1        0.77 ± 11%      +0.2        0.83 ± 13%      +0.1        0.79 ± 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
> >       0.44 ± 82%      +0.1        0.57 ± 47%      +0.2        0.67 ± 14%      +0.2        0.69 ±  9%  perf-profile.calltrace.cycles-pp.do_rmdir.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
> >       0.65 ± 53%      +0.1        0.78 ± 12%      +0.2        0.83 ± 12%      +0.1        0.80 ± 11%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mkdir
> >       0.61 ± 53%      +0.1        0.74 ± 16%      +0.1        0.75 ± 15%      +0.2        0.77 ± 12%  perf-profile.calltrace.cycles-pp.unregister_shrinker.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop
> >       0.38 ± 82%      +0.1        0.51 ± 45%      +0.0        0.41 ± 71%      +0.2        0.58 ±  8%  perf-profile.calltrace.cycles-pp.__fxstat64.device_set_syspath.sd_device_new_from_syspath
> >       1.30 ± 28%      +0.1        1.43 ± 11%      +0.1        1.37 ±  9%      +0.1        1.42 ± 12%  perf-profile.calltrace.cycles-pp.symlink
> >       0.60 ± 54%      +0.1        0.74 ± 18%      +0.2        0.76 ± 16%      +0.2        0.78 ± 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
> >       0.40 ± 81%      +0.1        0.54 ± 46%      +0.1        0.54 ± 48%      +0.2        0.64 ± 12%  perf-profile.calltrace.cycles-pp.__synchronize_srcu.unregister_shrinker.deactivate_locked_super.cleanup_mnt.task_work_run
> >       0.60 ± 54%      +0.1        0.74 ± 18%      +0.2        0.77 ± 15%      +0.2        0.78 ± 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.rmdir
> >       0.68 ± 53%      +0.1        0.82 ± 12%      +0.2        0.88 ± 11%      +0.2        0.84 ± 12%  perf-profile.calltrace.cycles-pp.mkdir
> >       0.70 ± 54%      +0.2        0.85 ± 14%      +0.2        0.85 ± 17%      +0.2        0.85 ±  9%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
> >       0.63 ± 54%      +0.2        0.80 ± 18%      +0.2        0.81 ± 15%      +0.2        0.82 ± 13%  perf-profile.calltrace.cycles-pp.rmdir
> >       0.61 ± 53%      +0.2        0.78 ± 24%      +0.2        0.79 ± 46%      +0.3        0.96 ± 25%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init
> >       0.63 ± 55%      +0.2        0.80 ± 15%      +0.2        0.80 ±  8%      +0.2        0.80 ± 13%  perf-profile.calltrace.cycles-pp.synchronize_rcu_expedited.namespace_unlock.do_umount.path_umount.__x64_sys_umount
> >       0.00            +0.2        0.17 ±141%      +0.0        0.00            +0.2        0.21 ±122%  perf-profile.calltrace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
> >       0.60 ± 51%      +0.2        0.78 ±  3%      +0.2        0.78 ± 13%      +0.1        0.70 ± 11%  perf-profile.calltrace.cycles-pp.do_readlinkat.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
> >       0.48 ± 82%      +0.2        0.66 ± 14%      +0.2        0.68 ± 18%      +0.2        0.67 ±  8%  perf-profile.calltrace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
> >       0.61 ± 51%      +0.2        0.79 ±  3%      +0.2        0.78 ± 12%      +0.1        0.71 ± 11%  perf-profile.calltrace.cycles-pp.__x64_sys_readlinkat.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
> >       0.61 ± 51%      +0.2        0.80 ±  3%      +0.2        0.79 ± 12%      +0.1        0.72 ± 11%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.readlinkat
> >       0.61 ± 51%      +0.2        0.80 ±  3%      +0.2        0.78 ± 13%      +0.1        0.72 ± 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.readlinkat
> >       0.49 ± 82%      +0.2        0.68 ± 12%      +0.2        0.70 ± 14%      +0.3        0.76 ± 13%  perf-profile.calltrace.cycles-pp.mnt_get_count.propagate_mount_busy.do_umount.path_umount.__x64_sys_umount
> >       0.00            +0.2        0.19 ±141%      +0.0        0.00            +0.2        0.25 ±122%  perf-profile.calltrace.cycles-pp.delayed_free_vfsmnt.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd
> >       0.48 ± 81%      +0.2        0.68 ± 13%      +0.3        0.74 ± 13%      +0.2        0.71 ± 11%  perf-profile.calltrace.cycles-pp.do_mkdirat.__x64_sys_mkdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.mkdir
> >       0.62 ± 50%      +0.2        0.83 ±  4%      +0.2        0.82 ± 12%      +0.1        0.74 ± 11%  perf-profile.calltrace.cycles-pp.readlinkat
> >       0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations
> >       0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.x86_64_start_kernel.secondary_startup_64_no_verify
> >       0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
> >       0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
> >       0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel.secondary_startup_64_no_verify
> >       0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.rest_init.arch_call_rest_init.start_kernel.x86_64_start_reservations.x86_64_start_kernel
> >       0.70 ± 53%      +0.2        0.92 ± 19%      +0.3        1.00 ± 22%      +0.4        1.10 ± 25%  perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.rest_init.arch_call_rest_init.start_kernel
> >       0.47 ± 82%      +0.2        0.70 ±  8%      +0.2        0.68 ± 11%      +0.3        0.73 ± 15%  perf-profile.calltrace.cycles-pp.vfs_symlink.do_symlinkat.__x64_sys_symlink.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       0.49 ± 82%      +0.2        0.73 ± 17%      +0.3        0.75 ± 15%      +0.3        0.76 ± 11%  perf-profile.calltrace.cycles-pp.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
> >       3.47 ± 25%      +0.6        4.06 ± 14%      +0.7        4.18 ± 11%      +0.8        4.22 ± 10%  perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
> >       4.38 ± 24%      +0.7        5.08 ± 13%      +0.8        5.17 ± 10%      +0.9        5.25 ± 10%  perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork
> >       0.32 ± 81%      +0.7        1.04 ± 90%      +0.3        0.64 ±113%      +0.7        1.04 ± 97%  perf-profile.calltrace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork
> >       0.00            +0.9        0.94 ± 15%      +0.9        0.87 ± 14%      +0.9        0.87 ± 11%  perf-profile.calltrace.cycles-pp.memset_orig.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc
> >       0.00            +1.0        0.97 ± 92%      +0.6        0.57 ±113%      +1.0        0.98 ± 98%  perf-profile.calltrace.cycles-pp.rcu_do_batch.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn
> >       0.00            +1.0        0.98 ± 92%      +0.6        0.58 ±113%      +1.0        0.99 ± 98%  perf-profile.calltrace.cycles-pp.rcu_core.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread
> >       0.00            +1.0        1.00 ± 92%      +0.6        0.58 ±113%      +1.0        1.00 ± 98%  perf-profile.calltrace.cycles-pp.__do_softirq.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
> >       0.00            +1.0        1.00 ± 92%      +0.6        0.58 ±113%      +1.0        1.00 ± 98%  perf-profile.calltrace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
> >       4.92 ± 21%      +1.4        6.32 ± 11%      +1.2        6.09 ±  9%      +1.5        6.46 ± 16%  perf-profile.calltrace.cycles-pp.ret_from_fork
> >       4.92 ± 21%      +1.4        6.32 ± 11%      +1.2        6.09 ±  9%      +1.5        6.46 ± 16%  perf-profile.calltrace.cycles-pp.kthread.ret_from_fork
> >       0.00            +1.5        1.45 ± 50%      +2.1        2.08 ± 21%      +2.3        2.34 ±  4%  perf-profile.calltrace.cycles-pp.pcpu_find_block_fit.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc
> >       0.00            +4.3        4.27 ± 29%      +5.5        5.47 ± 17%      +6.0        5.96 ±  5%  perf-profile.calltrace.cycles-pp.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_super
> >       2.84 ± 30%      +4.6        7.44 ± 18%      +6.1        8.92 ± 16%      +6.6        9.42 ±  6%  perf-profile.calltrace.cycles-pp.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64
> >       2.85 ± 30%      +4.6        7.46 ± 18%      +6.1        8.94 ± 16%      +6.6        9.44 ±  6%  perf-profile.calltrace.cycles-pp.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> >       7.97 ± 28%      +4.7       12.64 ± 14%      +6.3       14.28 ± 13%      +7.1       15.02 ±  8%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mount
> >       7.93 ± 28%      +4.7       12.60 ± 14%      +6.3       14.25 ± 13%      +7.0       14.98 ±  8%  perf-profile.calltrace.cycles-pp.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
> >       1.56 ± 29%      +4.7        6.23 ± 21%      +6.0        7.55 ± 16%      +6.5        8.04 ±  5%  perf-profile.calltrace.cycles-pp.alloc_super.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount
> >       7.95 ± 28%      +4.7       12.62 ± 14%      +6.3       14.27 ± 13%      +7.0       15.00 ±  8%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
> >       8.02 ± 28%      +4.7       12.69 ± 14%      +6.3       14.34 ± 13%      +7.1       15.07 ±  8%  perf-profile.calltrace.cycles-pp.mount
> >       1.68 ± 30%      +4.7        6.36 ± 21%      +6.0        7.72 ± 16%      +6.5        8.20 ±  5%  perf-profile.calltrace.cycles-pp.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
> >       7.20 ± 28%      +4.7       11.89 ± 15%      +6.3       13.52 ± 13%      +7.0       14.19 ±  9%  perf-profile.calltrace.cycles-pp.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
> >       0.00            +4.9        4.90 ± 25%      +6.2        6.17 ± 16%      +6.6        6.61 ±  5%  perf-profile.calltrace.cycles-pp.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_super.vfs_get_tree
> >      42.15 ± 23%      -6.7       35.41 ±  9%      -8.5       33.69 ± 11%      -9.4       32.80 ±  8%  perf-profile.children.cycles-pp.start_secondary
> >      42.92 ± 22%      -6.6       36.33 ±  8%      -8.2       34.69 ± 10%      -9.0       33.89 ±  8%  perf-profile.children.cycles-pp.secondary_startup_64_no_verify
> >      42.92 ± 22%      -6.6       36.33 ±  8%      -8.2       34.69 ± 10%      -9.0       33.89 ±  8%  perf-profile.children.cycles-pp.cpu_startup_entry
> >      42.91 ± 22%      -6.6       36.32 ±  8%      -8.2       34.68 ± 10%      -9.0       33.89 ±  8%  perf-profile.children.cycles-pp.do_idle
> >      42.18 ± 23%      -6.6       35.61 ±  9%      -8.2       33.97 ± 11%      -9.0       33.21 ±  8%  perf-profile.children.cycles-pp.cpuidle_idle_call
> >      41.57 ± 23%      -6.5       35.07 ±  9%      -8.2       33.34 ± 11%      -9.0       32.58 ±  8%  perf-profile.children.cycles-pp.cpuidle_enter_state
> >      41.57 ± 23%      -6.5       35.08 ±  9%      -8.2       33.35 ± 11%      -9.0       32.58 ±  8%  perf-profile.children.cycles-pp.cpuidle_enter
> >      37.09 ± 26%      -6.1       30.96 ± 10%      -8.1       28.98 ± 12%      -8.5       28.64 ±  8%  perf-profile.children.cycles-pp.intel_idle
> >       5.40 ±  7%      -1.0        4.35 ± 11%      -0.4        5.01 ± 14%      -1.0        4.37 ± 16%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
> >       5.01 ±  6%      -1.0        4.00 ± 12%      -0.4        4.64 ± 15%      -1.0        4.02 ± 17%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
> >       2.16 ± 21%      -0.7        1.51 ± 51%      -0.3        1.87 ± 41%      -0.6        1.55 ± 61%  perf-profile.children.cycles-pp.__irq_exit_rcu
> >       2.51 ± 11%      -0.3        2.19 ±  8%      -0.1        2.46 ± 16%      -0.4        2.11 ±  9%  perf-profile.children.cycles-pp.hrtimer_interrupt
> >       2.53 ± 11%      -0.3        2.21 ±  8%      -0.0        2.48 ± 16%      -0.4        2.13 ±  9%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
> >       1.47 ± 15%      -0.3        1.20 ± 19%      +0.0        1.51 ± 25%      -0.2        1.29 ± 20%  perf-profile.children.cycles-pp.clock_nanosleep
> >       2.09 ± 12%      -0.2        1.85 ±  7%      -0.1        2.02 ± 16%      -0.4        1.72 ±  7%  perf-profile.children.cycles-pp.__hrtimer_run_queues
> >       1.30 ± 15%      -0.2        1.06 ± 19%      +0.0        1.33 ± 25%      -0.2        1.14 ± 21%  perf-profile.children.cycles-pp.hrtimer_nanosleep
> >       1.31 ± 15%      -0.2        1.07 ± 19%      +0.0        1.34 ± 25%      -0.2        1.15 ± 21%  perf-profile.children.cycles-pp.common_nsleep
> >       1.28 ± 15%      -0.2        1.04 ± 19%      +0.0        1.31 ± 25%      -0.2        1.13 ± 21%  perf-profile.children.cycles-pp.do_nanosleep
> >       1.34 ± 14%      -0.2        1.10 ± 19%      +0.0        1.37 ± 25%      -0.2        1.17 ± 21%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
> >       1.18 ± 30%      -0.2        0.94 ± 16%      -0.2        0.97 ± 18%      -0.2        1.00 ± 11%  perf-profile.children.cycles-pp.__percpu_init_rwsem
> >       1.56 ± 13%      -0.2        1.38 ±  8%      -0.1        1.51 ± 17%      -0.3        1.30 ±  8%  perf-profile.children.cycles-pp.tick_sched_timer
> >       1.43 ± 11%      -0.2        1.26 ±  9%      -0.1        1.38 ± 15%      -0.2        1.21 ±  7%  perf-profile.children.cycles-pp.tick_sched_handle
> >       1.42 ± 11%      -0.2        1.25 ±  9%      -0.1        1.37 ± 15%      -0.2        1.20 ±  7%  perf-profile.children.cycles-pp.update_process_times
> >       1.34 ± 15%      -0.2        1.18 ± 17%      +0.1        1.41 ± 27%      -0.1        1.26 ± 17%  perf-profile.children.cycles-pp.newidle_balance
> >       1.26 ± 14%      -0.1        1.12 ± 17%      +0.0        1.31 ± 26%      -0.1        1.15 ± 16%  perf-profile.children.cycles-pp.load_balance
> >       1.12 ± 15%      -0.1        0.98 ± 18%      +0.0        1.17 ± 25%      -0.1        1.02 ± 17%  perf-profile.children.cycles-pp.update_sd_lb_stats
> >       1.15 ± 15%      -0.1        1.01 ± 18%      +0.0        1.19 ± 26%      -0.1        1.04 ± 17%  perf-profile.children.cycles-pp.find_busiest_group
> >       4.71 ± 20%      -0.1        4.57 ±  7%      +0.1        4.83 ±  7%      +0.2        4.91 ±  7%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
> >       1.13 ±  9%      -0.1        1.00 ±  8%      -0.0        1.09 ± 12%      -0.1        0.99 ±  8%  perf-profile.children.cycles-pp.scheduler_tick
> >       4.32 ± 21%      -0.1        4.19 ±  7%      +0.1        4.44 ±  8%      +0.2        4.54 ±  7%  perf-profile.children.cycles-pp.task_work_run
> >       1.00 ± 16%      -0.1        0.88 ± 19%      +0.0        1.03 ± 25%      -0.1        0.92 ± 18%  perf-profile.children.cycles-pp.update_sg_lb_stats
> >       3.08 ± 25%      -0.1        2.96 ± 10%      +0.1        3.20 ± 11%      +0.2        3.30 ±  9%  perf-profile.children.cycles-pp.cleanup_mnt
> >       0.79 ± 26%      -0.1        0.68 ± 11%      -0.0        0.74 ± 15%      -0.0        0.76 ±  8%  perf-profile.children.cycles-pp.mnt_get_writers
> >       0.69 ± 18%      -0.1        0.60 ± 13%      -0.1        0.60 ± 12%      -0.1        0.57 ± 10%  perf-profile.children.cycles-pp.path_init
> >       0.49 ± 19%      -0.1        0.40 ± 10%      -0.0        0.48 ± 19%      +0.0        0.50 ± 14%  perf-profile.children.cycles-pp.menu_select
> >       0.59 ± 33%      -0.1        0.50 ± 17%      -0.0        0.57 ± 12%      -0.0        0.57 ± 14%  perf-profile.children.cycles-pp.memcg_list_lru_alloc
> >       0.81 ± 31%      -0.1        0.72 ± 14%      -0.0        0.80 ± 13%      -0.0        0.79 ± 13%  perf-profile.children.cycles-pp.slab_pre_alloc_hook
> >       0.77 ±  8%      -0.1        0.69 ± 10%      -0.0        0.76 ± 15%      -0.1        0.72 ±  8%  perf-profile.children.cycles-pp.perf_event_task_tick
> >       0.27 ± 19%      -0.1        0.19 ± 25%      -0.1        0.20 ± 23%      -0.1        0.17 ± 19%  perf-profile.children.cycles-pp.ep_poll
> >       0.21 ± 37%      -0.1        0.14 ± 24%      -0.0        0.21 ± 33%      +0.0        0.23 ± 30%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
> >       9.23 ± 26%      -0.1        9.16 ± 12%      +0.5        9.68 ± 11%      +0.7        9.94 ± 10%  perf-profile.children.cycles-pp.umount2
> >       0.28 ± 21%      -0.1        0.20 ± 24%      -0.1        0.22 ± 23%      -0.1        0.19 ± 16%  perf-profile.children.cycles-pp.do_epoll_wait
> >       0.76 ±  8%      -0.1        0.68 ± 10%      -0.0        0.75 ± 16%      -0.0        0.71 ±  7%  perf-profile.children.cycles-pp.perf_adjust_freq_unthr_context
> >       0.34 ± 18%      -0.1        0.26 ± 25%      -0.1        0.28 ± 21%      -0.1        0.24 ± 12%  perf-profile.children.cycles-pp.epoll_wait
> >       1.94 ± 15%      -0.1        1.87 ± 10%      +0.1        2.07 ± 18%      -0.0        1.92 ±  8%  perf-profile.children.cycles-pp.pick_next_task_fair
> >       0.28 ± 19%      -0.1        0.21 ± 26%      -0.1        0.22 ± 23%      -0.1        0.19 ± 16%  perf-profile.children.cycles-pp.__x64_sys_epoll_wait
> >       2.33 ± 24%      -0.1        2.27 ± 16%      +0.0        2.35 ± 11%      +0.2        2.49 ± 15%  perf-profile.children.cycles-pp.alloc_vfsmnt
> >       0.28 ± 10%      -0.1        0.22 ± 21%      +0.0        0.28 ± 17%      -0.0        0.24 ± 20%  perf-profile.children.cycles-pp.clockevents_program_event
> >       0.14 ± 56%      -0.1        0.08 ± 23%      +0.0        0.16 ± 39%      +0.0        0.18 ± 36%  perf-profile.children.cycles-pp.tick_nohz_next_event
> >       0.47 ± 20%      -0.1        0.42 ± 12%      -0.0        0.42 ± 17%      -0.0        0.45 ±  5%  perf-profile.children.cycles-pp.__wake_up_common_lock
> >       1.18 ± 23%      -0.1        1.12 ± 16%      +0.0        1.20 ± 16%      +0.1        1.26 ± 11%  perf-profile.children.cycles-pp.mntput_no_expire
> >       1.17 ± 30%      -0.1        1.12 ± 12%      +0.0        1.21 ± 13%      +0.0        1.20 ± 14%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru
> >       0.33 ± 21%      -0.0        0.28 ±  8%      -0.0        0.31 ± 10%      -0.0        0.29 ± 13%  perf-profile.children.cycles-pp.dequeue_entity
> >       0.16 ± 22%      -0.0        0.11 ± 38%      -0.0        0.11 ± 35%      -0.1        0.09 ± 37%  perf-profile.children.cycles-pp.schedule_hrtimeout_range_clock
> >       0.08 ± 27%      -0.0        0.03 ±100%      -0.0        0.07 ± 23%      -0.0        0.04 ± 87%  perf-profile.children.cycles-pp.llist_reverse_order
> >       0.39 ± 59%      -0.0        0.34 ± 64%      -0.1        0.34 ± 87%      -0.0        0.38 ± 64%  perf-profile.children.cycles-pp.ktime_get
> >       0.06 ± 56%      -0.0        0.01 ±223%      -0.0        0.03 ±102%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp._ext4_show_options
> >       0.56 ± 29%      -0.0        0.51 ± 11%      -0.1        0.48 ± 10%      -0.1        0.50 ± 16%  perf-profile.children.cycles-pp.__xstat64
> >       0.20 ± 23%      -0.0        0.15 ± 23%      -0.0        0.15 ± 30%      -0.1        0.15 ± 20%  perf-profile.children.cycles-pp.__sys_recvmsg
> >       0.42 ± 32%      -0.0        0.37 ± 18%      +0.0        0.44 ± 12%      +0.0        0.45 ± 21%  perf-profile.children.cycles-pp.ramfs_fill_super
> >       0.18 ± 11%      -0.0        0.13 ± 16%      -0.0        0.15 ± 23%      -0.0        0.15 ± 32%  perf-profile.children.cycles-pp.read_tsc
> >       1.23 ± 20%      -0.0        1.19 ±  8%      +0.1        1.29 ±  9%      +0.0        1.28 ± 11%  perf-profile.children.cycles-pp.dput
> >       0.53 ± 27%      -0.0        0.49 ± 16%      -0.0        0.49 ±  8%      -0.1        0.47 ± 12%  perf-profile.children.cycles-pp.strcmp@plt
> >       0.13 ± 36%      -0.0        0.08 ± 13%      -0.0        0.09 ± 19%      -0.0        0.08 ± 15%  perf-profile.children.cycles-pp.pcpu_block_refresh_hint
> >       0.28 ±  8%      -0.0        0.24 ± 19%      -0.0        0.27 ± 19%      -0.0        0.25 ± 12%  perf-profile.children.cycles-pp.__intel_pmu_enable_all
> >       0.54 ± 29%      -0.0        0.50 ± 14%      +0.0        0.56 ± 14%      +0.0        0.56 ± 18%  perf-profile.children.cycles-pp.__dentry_kill
> >       1.56 ± 24%      -0.0        1.52 ± 14%      +0.0        1.60 ± 15%      +0.2        1.74 ± 10%  perf-profile.children.cycles-pp.mnt_get_count
> >       0.60 ± 30%      -0.0        0.56 ± 13%      +0.0        0.62 ± 15%      +0.0        0.62 ± 17%  perf-profile.children.cycles-pp.dentry_kill
> >       0.18 ± 21%      -0.0        0.14 ± 26%      -0.0        0.14 ± 29%      -0.0        0.14 ± 20%  perf-profile.children.cycles-pp.___sys_recvmsg
> >       2.09 ± 23%      -0.0        2.05 ± 15%      +0.1        2.14 ±  8%      +0.2        2.26 ± 14%  perf-profile.children.cycles-pp.copy_tree
> >       0.13 ± 17%      -0.0        0.09 ± 23%      -0.0        0.11 ± 23%      -0.0        0.09 ± 15%  perf-profile.children.cycles-pp.ct_kernel_exit_state
> >       0.28 ± 22%      -0.0        0.24 ± 15%      -0.0        0.24 ± 16%      -0.0        0.25 ±  5%  perf-profile.children.cycles-pp.__wake_up_common
> >       0.16 ± 26%      -0.0        0.12 ± 27%      -0.0        0.14 ± 29%      -0.0        0.12 ± 19%  perf-profile.children.cycles-pp.____sys_recvmsg
> >       2.06 ± 23%      -0.0        2.02 ± 15%      +0.1        2.12 ±  8%      +0.2        2.24 ± 15%  perf-profile.children.cycles-pp.clone_mnt
> >       0.21 ± 13%      -0.0        0.17 ± 22%      +0.0        0.22 ± 20%      -0.0        0.19 ± 21%  perf-profile.children.cycles-pp.lapic_next_deadline
> >       0.16 ± 25%      -0.0        0.12 ± 28%      -0.0        0.13 ± 28%      -0.0        0.12 ± 21%  perf-profile.children.cycles-pp.sock_recvmsg
> >       0.08 ± 18%      -0.0        0.04 ± 72%      -0.0        0.05 ± 73%      -0.0        0.05 ± 57%  perf-profile.children.cycles-pp.__pthread_mutex_unlock_usercnt
> >       0.13 ± 18%      -0.0        0.09 ± 27%      -0.0        0.11 ± 24%      -0.0        0.09 ±  8%  perf-profile.children.cycles-pp.ct_kernel_enter
> >       1.20 ± 15%      -0.0        1.16 ±  6%      -0.0        1.18 ±  8%      -0.0        1.15 ±  9%  perf-profile.children.cycles-pp.kmem_cache_alloc
> >       0.14 ± 16%      -0.0        0.10 ± 27%      -0.0        0.11 ± 23%      -0.0        0.10 ± 10%  perf-profile.children.cycles-pp.ct_idle_exit
> >       0.24 ± 10%      -0.0        0.20 ± 12%      -0.0        0.20 ± 19%      -0.0        0.20 ± 11%  perf-profile.children.cycles-pp.update_blocked_averages
> >       2.14 ± 23%      -0.0        2.11 ± 16%      +0.1        2.20 ±  8%      +0.2        2.34 ± 15%  perf-profile.children.cycles-pp.propagate_one
> >       0.21 ± 34%      -0.0        0.18 ± 10%      -0.0        0.19 ± 13%      -0.0        0.19 ± 20%  perf-profile.children.cycles-pp.up_read
> >       0.74 ± 27%      -0.0        0.71 ± 20%      +0.0        0.74 ± 15%      +0.0        0.79 ± 14%  perf-profile.children.cycles-pp.try_check_zero
> >       0.07 ± 61%      -0.0        0.03 ±100%      -0.0        0.05 ± 76%      +0.0        0.07 ± 18%  perf-profile.children.cycles-pp.xas_find
> >       0.25 ± 29%      -0.0        0.21 ± 18%      -0.1        0.19 ± 19%      -0.1        0.19 ± 22%  perf-profile.children.cycles-pp.__sys_sendmsg
> >       0.03 ± 82%      -0.0        0.00            +0.0        0.04 ±102%      +0.0        0.05 ± 54%  perf-profile.children.cycles-pp.idr_alloc
> >       0.05 ± 53%      -0.0        0.02 ±142%      -0.0        0.05 ± 80%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.get_next_timer_interrupt
> >       0.23 ± 25%      -0.0        0.20 ±  6%      -0.0        0.21 ± 21%      -0.1        0.18 ± 23%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
> >       0.22 ± 28%      -0.0        0.18 ± 15%      -0.1        0.16 ± 23%      -0.1        0.16 ± 20%  perf-profile.children.cycles-pp.unix_stream_sendmsg
> >       0.20 ± 28%      -0.0        0.17 ± 24%      -0.0        0.18 ± 14%      -0.0        0.18 ± 20%  perf-profile.children.cycles-pp.pcpu_block_update_hint_alloc
> >       0.22 ± 30%      -0.0        0.19 ± 13%      -0.1        0.17 ± 20%      -0.1        0.17 ± 21%  perf-profile.children.cycles-pp.sock_sendmsg
> >       0.03 ± 82%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.strcmp_ptr
> >       0.03 ± 82%      -0.0        0.00            -0.0        0.02 ±144%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.__x64_sys_execve
> >       0.03 ± 82%      -0.0        0.00            -0.0        0.02 ±144%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.execve
> >       0.03 ± 82%      -0.0        0.00            -0.0        0.02 ±144%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.do_execveat_common
> >       0.03 ± 82%      -0.0        0.00            +0.0        0.04 ± 71%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.__isoc99_sscanf
> >       0.03 ± 82%      -0.0        0.00            +0.0        0.04 ±102%      +0.0        0.05 ± 54%  perf-profile.children.cycles-pp.idr_alloc_u32
> >       0.15 ± 25%      -0.0        0.12 ± 30%      -0.0        0.11 ± 32%      -0.0        0.11 ± 23%  perf-profile.children.cycles-pp.unix_stream_read_generic
> >       0.15 ± 25%      -0.0        0.12 ± 30%      -0.0        0.11 ± 30%      -0.0        0.11 ± 23%  perf-profile.children.cycles-pp.unix_stream_recvmsg
> >       0.13 ± 23%      -0.0        0.10 ± 34%      -0.0        0.08 ± 28%      -0.0        0.09 ± 23%  perf-profile.children.cycles-pp.__libc_recvmsg
> >       0.22 ± 28%      -0.0        0.19 ± 14%      -0.0        0.18 ± 20%      -0.1        0.17 ± 21%  perf-profile.children.cycles-pp.____sys_sendmsg
> >       0.13 ± 29%      -0.0        0.10 ± 19%      -0.0        0.12 ± 12%      -0.0        0.11 ± 19%  perf-profile.children.cycles-pp.irqtime_account_irq
> >       0.03 ± 81%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.unix_stream_read_actor
> >       0.03 ±200%      -0.0        0.00            +0.0        0.04 ±147%      +0.0        0.07 ± 81%  perf-profile.children.cycles-pp.timekeeping_max_deferment
> >       0.38 ± 20%      -0.0        0.35 ±  8%      +0.0        0.40 ± 12%      +0.0        0.38 ± 14%  perf-profile.children.cycles-pp.dequeue_task_fair
> >       4.75 ± 19%      -0.0        4.72 ±  7%      +0.1        4.88 ±  7%      +0.2        4.99 ±  6%  perf-profile.children.cycles-pp.exit_to_user_mode_loop
> >       4.87 ± 19%      -0.0        4.84 ±  7%      +0.1        5.00 ±  7%      +0.2        5.09 ±  6%  perf-profile.children.cycles-pp.exit_to_user_mode_prepare
> >       0.17 ± 44%      -0.0        0.14 ± 21%      -0.0        0.15 ± 14%      -0.0        0.17 ±  8%  perf-profile.children.cycles-pp.apparmor_capable
> >       0.09 ± 26%      -0.0        0.06 ± 11%      -0.0        0.08 ± 52%      -0.1        0.04 ± 87%  perf-profile.children.cycles-pp.__pthread_mutex_lock
> >       0.09 ± 39%      -0.0        0.06 ± 49%      -0.0        0.08 ± 14%      -0.0        0.07 ± 20%  perf-profile.children.cycles-pp.__get_fs_type
> >       0.04 ± 82%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.calc_global_load_tick
> >       0.33 ± 20%      -0.0        0.30 ± 13%      -0.1        0.28 ± 14%      -0.0        0.29 ± 10%  perf-profile.children.cycles-pp.seq_path_root
> >       0.69 ± 22%      -0.0        0.66 ± 14%      -0.1        0.59 ± 13%      -0.1        0.57 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
> >       0.24 ± 30%      -0.0        0.21 ± 16%      -0.0        0.19 ± 19%      -0.0        0.19 ± 22%  perf-profile.children.cycles-pp.___sys_sendmsg
> >       0.04 ± 87%      -0.0        0.01 ±223%      -0.0        0.03 ±100%      -0.0        0.00        perf-profile.children.cycles-pp.enqueue_hrtimer
> >       0.10 ± 10%      -0.0        0.07 ± 47%      -0.0        0.08 ± 26%      -0.0        0.09 ± 11%  perf-profile.children.cycles-pp.path_put
> >       0.06 ± 15%      -0.0        0.04 ± 71%      -0.0        0.05 ± 45%      -0.0        0.04 ± 83%  perf-profile.children.cycles-pp.obj_cgroup_uncharge_pages
> >       0.04 ± 88%      -0.0        0.02 ±141%      +0.0        0.05 ± 56%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.strjoin_real
> >       0.22 ± 47%      -0.0        0.20 ± 23%      -0.0        0.19 ± 16%      -0.0        0.22 ±  9%  perf-profile.children.cycles-pp.security_capable
> >       0.06 ± 51%      -0.0        0.04 ± 71%      -0.0        0.06 ± 52%      -0.0        0.02 ±125%  perf-profile.children.cycles-pp.rwsem_down_read_slowpath
> >       0.49 ± 29%      -0.0        0.46 ± 10%      +0.0        0.52 ± 11%      +0.0        0.52 ± 21%  perf-profile.children.cycles-pp.ramfs_get_inode
> >       2.20 ± 24%      -0.0        2.18 ± 16%      +0.1        2.27 ±  8%      +0.2        2.39 ± 15%  perf-profile.children.cycles-pp.propagate_mnt
> >       0.82 ± 26%      -0.0        0.79 ±  6%      +0.1        0.87 ± 14%      +0.1        0.88 ±  9%  perf-profile.children.cycles-pp.kill_litter_super
> >       0.11 ± 27%      -0.0        0.08 ± 27%      +0.0        0.12 ± 28%      +0.0        0.11 ± 28%  perf-profile.children.cycles-pp.xas_load
> >       0.72 ± 30%      -0.0        0.69 ± 19%      +0.0        0.75 ± 19%      +0.0        0.76 ± 12%  perf-profile.children.cycles-pp.shmem_fill_super
> >       0.03 ±127%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.tick_nohz_irq_exit
> >       0.03 ±127%      -0.0        0.00            -0.0        0.02 ±141%      -0.0        0.00        perf-profile.children.cycles-pp.timerqueue_add
> >       0.15 ± 35%      -0.0        0.12 ± 14%      -0.0        0.12 ± 31%      -0.0        0.12 ± 29%  perf-profile.children.cycles-pp.sendmsg
> >       0.03 ± 84%      -0.0        0.01 ±223%      -0.0        0.03 ±100%      -0.0        0.00        perf-profile.children.cycles-pp.hrtimer_next_event_without
> >       0.03 ± 82%      -0.0        0.01 ±223%      +0.0        0.04 ±104%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.__libc_start_main
> >       0.03 ± 82%      -0.0        0.01 ±223%      +0.0        0.04 ±104%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.main
> >       0.03 ± 82%      -0.0        0.01 ±223%      +0.0        0.04 ±104%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.run_builtin
> >       0.07 ± 55%      -0.0        0.05 ± 72%      -0.0        0.05 ± 46%      -0.0        0.04 ± 83%  perf-profile.children.cycles-pp.sock_def_readable
> >       0.10 ± 28%      -0.0        0.07 ± 21%      +0.0        0.10 ± 41%      -0.0        0.06 ± 56%  perf-profile.children.cycles-pp.hrtimer_start_range_ns
> >       0.04 ± 83%      -0.0        0.01 ±223%      +0.0        0.06 ± 50%      +0.0        0.04 ± 50%  perf-profile.children.cycles-pp.perf_pmu_nop_void
> >       0.28 ± 33%      -0.0        0.25 ± 13%      -0.1        0.22 ± 11%      -0.1        0.21 ± 17%  perf-profile.children.cycles-pp.unit_name_is_valid
> >       0.06 ± 21%      -0.0        0.03 ±102%      -0.0        0.05 ± 80%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.current_time
> >       0.78 ± 27%      -0.0        0.76 ± 19%      +0.0        0.79 ± 14%      +0.0        0.83 ± 13%  perf-profile.children.cycles-pp.srcu_advance_state
> >       0.10 ± 30%      -0.0        0.08 ± 21%      -0.0        0.08 ± 49%      -0.0        0.08 ± 28%  perf-profile.children.cycles-pp.recvmsg
> >       0.02 ±122%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.seq_release
> >       0.02 ±125%      -0.0        0.00            -0.0        0.02 ±142%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.balance_fair
> >       0.08 ± 19%      -0.0        0.06 ± 48%      -0.0        0.07 ± 19%      -0.0        0.07 ± 22%  perf-profile.children.cycles-pp.ep_send_events
> >       0.19 ± 15%      -0.0        0.16 ± 14%      -0.0        0.18 ±  8%      -0.0        0.15 ± 12%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
> >       0.79 ± 15%      -0.0        0.77 ±  9%      +0.1        0.85 ±  6%      +0.0        0.80 ±  8%  perf-profile.children.cycles-pp.inode_permission
> >       0.21 ± 42%      -0.0        0.19 ± 24%      -0.0        0.19 ± 14%      +0.0        0.21 ± 12%  perf-profile.children.cycles-pp.ns_capable
> >       0.05 ± 58%      -0.0        0.03 ±103%      -0.0        0.01 ±223%      -0.0        0.03 ±123%  perf-profile.children.cycles-pp.consume_skb
> >       0.12 ± 15%      -0.0        0.10 ± 11%      -0.0        0.09 ± 20%      -0.0        0.09 ± 25%  perf-profile.children.cycles-pp.run_rebalance_domains
> >       0.02 ±123%      -0.0        0.00            -0.0        0.00            +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.___d_drop
> >       0.02 ±123%      -0.0        0.00            -0.0        0.02 ±141%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.get_random_u32
> >       0.28 ± 24%      -0.0        0.26 ± 15%      -0.1        0.22 ± 10%      -0.1        0.22 ±  9%  perf-profile.children.cycles-pp.rcu_note_context_switch
> >       0.21 ± 11%      -0.0        0.19 ± 10%      -0.0        0.20 ± 15%      -0.0        0.19 ± 12%  perf-profile.children.cycles-pp.d_alloc_parallel
> >       0.27 ± 29%      -0.0        0.25 ± 18%      -0.0        0.26 ± 26%      -0.0        0.23 ± 21%  perf-profile.children.cycles-pp.smp_call_function_single
> >       0.59 ± 28%      -0.0        0.57 ± 13%      -0.0        0.58 ± 14%      +0.0        0.60 ±  9%  perf-profile.children.cycles-pp.__d_alloc
> >       0.41 ± 24%      -0.0        0.38 ±  9%      -0.1        0.35 ± 10%      -0.0        0.36 ± 13%  perf-profile.children.cycles-pp.do_dentry_open
> >       0.06 ± 53%      -0.0        0.04 ±109%      -0.0        0.03 ±106%      -0.0        0.03 ±122%  perf-profile.children.cycles-pp.sync_regs
> >       0.15 ± 21%      -0.0        0.12 ± 21%      -0.0        0.13 ± 35%      -0.0        0.12 ± 20%  perf-profile.children.cycles-pp.rebalance_domains
> >       0.03 ± 84%      -0.0        0.01 ±223%      -0.0        0.03 ±101%      -0.0        0.00        perf-profile.children.cycles-pp.asm_exc_page_fault
> >       0.05 ± 52%      -0.0        0.03 ±103%      -0.0        0.03 ±100%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.device_get_id_filename
> >       0.12 ± 29%      -0.0        0.10 ±  8%      -0.0        0.10 ± 16%      -0.0        0.09 ± 15%  perf-profile.children.cycles-pp.shmem_show_options
> >       2.88 ± 15%      -0.0        2.86 ±  5%      -0.0        2.84 ±  7%      -0.1        2.78 ±  4%  perf-profile.children.cycles-pp.path_lookupat
> >       0.25 ± 26%      -0.0        0.23 ±  9%      -0.0        0.24 ± 11%      -0.0        0.25 ± 12%  perf-profile.children.cycles-pp.fsnotify_destroy_marks
> >       0.05 ± 55%      -0.0        0.03 ±100%      -0.0        0.03 ±100%      -0.0        0.03 ± 84%  perf-profile.children.cycles-pp.update_cfs_group
> >       0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__d_rehash
> >       0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.skb_copy_datagram_iter
> >       0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__skb_datagram_iter
> >       0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±200%  perf-profile.children.cycles-pp._find_first_bit
> >       0.02 ±122%      -0.0        0.00            -0.0        0.02 ±141%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.greedy_realloc
> >       0.02 ±122%      -0.0        0.00            -0.0        0.02 ±141%      +0.0        0.04 ± 83%  perf-profile.children.cycles-pp.__mem_cgroup_charge
> >       0.21 ± 20%      -0.0        0.19 ± 17%      -0.0        0.19 ± 13%      -0.0        0.19 ±  7%  perf-profile.children.cycles-pp.ep_poll_callback
> >       0.48 ± 22%      -0.0        0.46 ± 10%      +0.0        0.50 ± 12%      +0.0        0.49 ±  7%  perf-profile.children.cycles-pp.update_load_avg
> >       0.03 ±124%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.ep_autoremove_wake_function
> >       0.36 ± 23%      -0.0        0.34 ±  8%      -0.0        0.36 ± 12%      +0.0        0.40 ±  8%  perf-profile.children.cycles-pp.sync_filesystem
> >       0.21 ± 21%      -0.0        0.19 ±  9%      -0.0        0.20 ± 13%      -0.0        0.18 ±  9%  perf-profile.children.cycles-pp.rcu_all_qs
> >       0.12 ± 17%      -0.0        0.10 ± 22%      -0.0        0.11 ± 10%      -0.0        0.09 ± 17%  perf-profile.children.cycles-pp.perf_rotate_context
> >       0.13 ± 23%      -0.0        0.11 ± 22%      -0.0        0.09 ± 34%      -0.0        0.08 ± 20%  perf-profile.children.cycles-pp.__libc_sendmsg
> >       0.82 ± 22%      -0.0        0.80 ±  3%      -0.0        0.81 ±  9%      -0.0        0.80 ±  6%  perf-profile.children.cycles-pp.__fput
> >       0.29 ± 26%      -0.0        0.27 ± 25%      -0.0        0.28 ± 13%      +0.0        0.31 ±  9%  perf-profile.children.cycles-pp.srcu_gp_start_if_needed
> >       0.78 ± 26%      -0.0        0.76 ±  6%      +0.1        0.85 ± 14%      +0.1        0.84 ±  9%  perf-profile.children.cycles-pp.generic_shutdown_super
> >       0.32 ± 32%      -0.0        0.30 ± 22%      +0.0        0.34 ± 18%      +0.0        0.36 ± 19%  perf-profile.children.cycles-pp.d_make_root
> >       0.91 ± 31%      -0.0        0.90 ± 14%      +0.1        0.99 ± 15%      +0.0        0.95 ± 18%  perf-profile.children.cycles-pp.new_inode
> >       0.20 ± 35%      -0.0        0.18 ± 18%      -0.0        0.18 ± 15%      +0.0        0.22 ± 16%  perf-profile.children.cycles-pp.vfs_parse_fs_param
> >       0.20 ± 29%      -0.0        0.18 ± 15%      -0.0        0.19 ± 11%      +0.0        0.20 ± 16%  perf-profile.children.cycles-pp.fsnotify_grab_connector
> >       0.49 ± 30%      -0.0        0.47 ± 13%      -0.1        0.43 ± 10%      -0.0        0.44 ± 16%  perf-profile.children.cycles-pp.__do_sys_newstat
> >       0.29 ± 20%      -0.0        0.27 ±  7%      -0.0        0.27 ±  7%      -0.0        0.26 ±  8%  perf-profile.children.cycles-pp.rep_movs_alternative
> >       0.24 ± 15%      -0.0        0.22 ± 11%      -0.0        0.22 ± 20%      -0.0        0.21 ± 11%  perf-profile.children.cycles-pp.native_irq_return_iret
> >       0.03 ±122%      -0.0        0.01 ±223%      +0.0        0.03 ±101%      -0.0        0.00        perf-profile.children.cycles-pp.trigger_load_balance
> >       0.04 ± 90%      -0.0        0.02 ±144%      -0.0        0.02 ±142%      -0.0        0.02 ±125%  perf-profile.children.cycles-pp.inode_wait_for_writeback
> >       0.11 ± 36%      -0.0        0.09 ± 26%      -0.0        0.10 ± 12%      -0.0        0.09 ± 19%  perf-profile.children.cycles-pp.get_fs_type
> >       0.03 ±123%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.check_stack_object
> >       0.08 ± 62%      -0.0        0.06 ± 15%      -0.0        0.06 ± 23%      +0.0        0.08 ± 51%  perf-profile.children.cycles-pp.generic_parse_monolithic
> >       0.32 ± 24%      -0.0        0.31 ± 14%      +0.0        0.33 ± 15%      -0.0        0.30 ± 15%  perf-profile.children.cycles-pp.cp_new_stat
> >       0.30 ± 29%      -0.0        0.29 ±  9%      +0.0        0.32 ± 10%      +0.0        0.35 ± 13%  perf-profile.children.cycles-pp.memcg_destroy_list_lru
> >       0.43 ± 20%      -0.0        0.42 ± 10%      -0.0        0.39 ±  7%      -0.0        0.41 ±  7%  perf-profile.children.cycles-pp.do_open
> >       0.20 ± 25%      -0.0        0.18 ± 27%      -0.0        0.18 ± 14%      -0.0        0.17 ± 18%  perf-profile.children.cycles-pp.finish_task_switch
> >       0.14 ± 39%      -0.0        0.12 ± 26%      -0.0        0.13 ± 14%      +0.0        0.15 ±  6%  perf-profile.children.cycles-pp.__list_lru_init
> >       0.09 ± 24%      -0.0        0.07 ±  9%      -0.0        0.07 ± 55%      -0.0        0.07 ± 15%  perf-profile.children.cycles-pp.update_irq_load_avg
> >       0.87 ± 22%      -0.0        0.85 ±  8%      -0.0        0.85 ± 11%      -0.0        0.86 ±  9%  perf-profile.children.cycles-pp.kmem_cache_free
> >       0.15 ± 23%      -0.0        0.13 ± 16%      -0.0        0.14 ±  9%      -0.0        0.14 ± 11%  perf-profile.children.cycles-pp.set_root
> >       0.02 ±200%      -0.0        0.00            +0.0        0.02 ±142%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.inode_init_once
> >       0.19 ± 11%      -0.0        0.17 ± 16%      -0.0        0.18 ± 30%      -0.1        0.13 ±  8%  perf-profile.children.cycles-pp.hrtimer_wakeup
> >       0.36 ± 11%      -0.0        0.34 ±  6%      -0.0        0.31 ± 10%      -0.0        0.33 ±  7%  perf-profile.children.cycles-pp.rcu_report_exp_cpu_mult
> >       0.35 ± 17%      -0.0        0.33 ± 10%      +0.0        0.35 ± 16%      +0.0        0.35 ±  3%  perf-profile.children.cycles-pp.__kmem_cache_free
> >       0.02 ±125%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.01 ±200%  perf-profile.children.cycles-pp.mounts_open_common
> >       0.02 ±125%      -0.0        0.01 ±223%      -0.0        0.02 ±141%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.fsnotify_sb_delete
> >       0.02 ±125%      -0.0        0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.03 ±123%  perf-profile.children.cycles-pp.try_charge_memcg
> >       0.03 ± 82%      -0.0        0.02 ±142%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.__socket
> >       0.09 ± 20%      -0.0        0.08 ± 22%      -0.0        0.09 ± 33%      -0.0        0.08 ± 17%  perf-profile.children.cycles-pp.__fget_light
> >       0.03 ± 82%      -0.0        0.02 ±141%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.__sys_socket
> >       0.16 ± 20%      -0.0        0.14 ± 11%      -0.0        0.13 ± 24%      -0.0        0.13 ± 12%  perf-profile.children.cycles-pp.mangle_path
> >       0.16 ± 53%      -0.0        0.14 ± 29%      +0.0        0.16 ± 15%      -0.0        0.15 ± 15%  perf-profile.children.cycles-pp.__lookup_mnt
> >       0.17 ± 19%      -0.0        0.16 ± 21%      -0.0        0.16 ±  9%      -0.0        0.16 ± 11%  perf-profile.children.cycles-pp.nd_jump_root
> >       0.30 ± 35%      -0.0        0.28 ± 14%      -0.0        0.28 ± 12%      +0.0        0.31 ± 15%  perf-profile.children.cycles-pp.vfs_parse_fs_string
> >       0.09 ± 56%      -0.0        0.07 ± 20%      -0.0        0.08 ± 24%      +0.0        0.09 ± 15%  perf-profile.children.cycles-pp.strspn@plt
> >       0.06 ± 58%      -0.0        0.04 ± 72%      -0.0        0.04 ± 71%      -0.0        0.03 ± 82%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
> >       0.31 ± 19%      -0.0        0.29 ± 12%      +0.0        0.31 ± 16%      -0.0        0.29 ±  9%  perf-profile.children.cycles-pp.down_read
> >       0.16 ± 23%      -0.0        0.15 ± 25%      -0.0        0.14 ± 29%      -0.0        0.12 ±  6%  perf-profile.children.cycles-pp.rcu_sched_clock_irq
> >       0.02 ±125%      -0.0        0.01 ±223%      -0.0        0.02 ±144%      +0.0        0.04 ± 82%  perf-profile.children.cycles-pp.task_tick_fair
> >       0.17 ± 24%      -0.0        0.16 ± 11%      +0.0        0.18 ± 15%      +0.0        0.18 ± 10%  perf-profile.children.cycles-pp.__update_load_avg_se
> >       0.11 ±  6%      -0.0        0.10 ± 23%      -0.0        0.10 ± 30%      -0.0        0.10 ± 16%  perf-profile.children.cycles-pp.__update_blocked_fair
> >       0.05 ± 90%      -0.0        0.04 ± 72%      -0.0        0.04 ±105%      -0.0        0.03 ±123%  perf-profile.children.cycles-pp.mnt_fstype_is_pseudofs
> >       0.03 ± 82%      -0.0        0.02 ±142%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.__x64_sys_socket
> >       0.02 ±123%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.rcu_gp_kthread
> >       0.09 ± 23%      -0.0        0.08 ±  8%      -0.0        0.07 ± 47%      -0.0        0.08 ± 19%  perf-profile.children.cycles-pp.generic_fillattr
> >       0.39 ± 17%      -0.0        0.38 ± 20%      -0.0        0.36 ± 22%      -0.0        0.36 ± 13%  perf-profile.children.cycles-pp.schedule_idle
> >       0.40 ± 22%      -0.0        0.39 ±  9%      -0.0        0.38 ±  9%      +0.0        0.43 ±  9%  perf-profile.children.cycles-pp.vfs_fstat
> >       0.03 ± 81%      -0.0        0.02 ±141%      +0.0        0.05 ± 48%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.handle_dots
> >       0.35 ± 23%      -0.0        0.33 ±  7%      -0.0        0.34 ± 13%      +0.0        0.38 ±  7%  perf-profile.children.cycles-pp.writeback_inodes_sb
> >       0.02 ±122%      -0.0        0.01 ±223%      +0.0        0.02 ± 99%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp._dbus_marshal_read_uint32
> >       0.07 ± 32%      -0.0        0.06 ± 52%      +0.0        0.08 ± 16%      +0.0        0.09 ±  9%  perf-profile.children.cycles-pp.__wrgsbase_inactive
> >       0.15 ± 20%      -0.0        0.14 ± 18%      -0.0        0.13 ± 12%      +0.0        0.17 ±  7%  perf-profile.children.cycles-pp.kernfs_iop_getattr
> >       0.17 ± 23%      -0.0        0.16 ± 17%      +0.0        0.17 ± 13%      -0.0        0.15 ±  9%  perf-profile.children.cycles-pp._copy_to_user
> >       0.04 ± 50%      -0.0        0.03 ±101%      -0.0        0.02 ± 99%      +0.0        0.06 ± 14%  perf-profile.children.cycles-pp.may_open
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.xas_expand
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.map_id_range_down
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.reweight_entity
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.rb_insert_color
> >       0.01 ±200%      -0.0        0.00            +0.0        0.02 ±141%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.check_spread
> >       0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.tick_nohz_idle_enter
> >       0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.radix_tree_delete_item
> >       0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.siphash24_compress@plt
> >       0.05 ± 55%      -0.0        0.04 ± 75%      +0.0        0.07 ± 27%      +0.0        0.06 ± 12%  perf-profile.children.cycles-pp.getdelim
> >       0.11 ± 20%      -0.0        0.10 ± 26%      -0.0        0.10 ±  6%      -0.0        0.07 ± 55%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
> >       0.06 ± 57%      -0.0        0.05 ± 77%      +0.0        0.08 ± 24%      +0.0        0.07 ± 20%  perf-profile.children.cycles-pp.xas_start
> >       0.04 ± 83%      -0.0        0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.strncmp
> >       0.09 ± 19%      -0.0        0.08 ±  9%      +0.0        0.09 ± 30%      -0.0        0.09 ± 15%  perf-profile.children.cycles-pp.pcpu_block_update
> >       3.69 ± 15%      -0.0        3.68 ±  9%      +0.2        3.86 ± 12%      -0.0        3.65 ±  6%  perf-profile.children.cycles-pp.__schedule
> >       0.07 ± 58%      -0.0        0.06 ± 53%      +0.0        0.08 ± 14%      +0.0        0.08 ± 19%  perf-profile.children.cycles-pp.__srcu_read_unlock
> >       0.41 ± 19%      -0.0        0.40 ±  9%      -0.0        0.41 ± 13%      +0.0        0.45 ± 10%  perf-profile.children.cycles-pp.mod_objcg_state
> >       0.22 ± 23%      -0.0        0.21 ± 10%      -0.0        0.20 ± 11%      -0.0        0.19 ± 12%  perf-profile.children.cycles-pp.__sysvec_call_function_single
> >       0.15 ± 16%      -0.0        0.14 ± 21%      +0.0        0.18 ± 15%      +0.0        0.16 ± 13%  perf-profile.children.cycles-pp.mutex_lock
> >       0.04 ± 85%      -0.0        0.03 ±101%      -0.0        0.01 ±223%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.__mem_cgroup_uncharge_list
> >       0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.kmem_cache_alloc_node
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp._dbus_type_reader_recurse
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.dentry_path
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.apparmor_inode_getattr
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.timekeeping_advance
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.update_wall_time
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.hashmap_get2@plt
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.update_rt_rq_load_avg
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.delete_trailing_chars
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp._IO_setb
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.srcu_gp_start
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.siphash24_init@plt
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.strsep
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.error_entry
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.radix_tree_node_rcu_free
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.make_kuid
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.skb_release_head_state
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.unix_destruct_scm
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.rcu_sync_init
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.sock_wfree
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.__mod_lruvec_page_state
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.autoremove_wake_function
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.security_path_mkdir
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.seq_open
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.mem_cgroup_handle_over_high
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.object_path_is_valid
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__poll
> >       0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.putname
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.__errno_location
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.irq_work_run_list
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.rcu_gp_fqs_loop
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.sd_bus_message_open_container
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.rb_next
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.arch_cpu_idle_enter
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.tsc_verify_tsc_adjust
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.stress_ramfs_umount
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp._hashmap_size
> >       0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.connect
> >       0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.page_counter_uncharge
> >       0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__mark_inode_dirty
> >       0.01 ±200%      -0.0        0.00            +0.0        0.02 ±144%      -0.0        0.00        perf-profile.children.cycles-pp.security_path_unlink
> >       0.03 ±130%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.strnlen
> >       0.07 ± 53%      -0.0        0.06 ± 48%      -0.0        0.06 ± 18%      -0.0        0.05 ± 56%  perf-profile.children.cycles-pp.readlink
> >       0.05 ± 53%      -0.0        0.04 ± 72%      -0.0        0.04 ± 72%      +0.0        0.05 ± 54%  perf-profile.children.cycles-pp.cpuidle_governor_latency_req
> >       0.29 ± 22%      -0.0        0.28 ±  9%      -0.0        0.28 ±  8%      -0.0        0.24 ± 11%  perf-profile.children.cycles-pp.security_file_alloc
> >       0.03 ±123%      -0.0        0.02 ±141%      +0.0        0.03 ±100%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.hashmap_get2
> >       0.08 ± 19%      -0.0        0.07 ± 50%      +0.0        0.09 ± 18%      +0.0        0.09 ± 22%  perf-profile.children.cycles-pp.common_perm_cond
> >       0.04 ± 83%      -0.0        0.03 ±100%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp._hashmap_get
> >       0.04 ± 83%      -0.0        0.03 ±100%      -0.0        0.02 ±145%      +0.0        0.04 ± 83%  perf-profile.children.cycles-pp.deactivate_super
> >       0.27 ± 23%      -0.0        0.26 ± 13%      -0.0        0.24 ± 15%      -0.0        0.24 ± 13%  perf-profile.children.cycles-pp.sysvec_call_function_single
> >       0.08 ± 59%      -0.0        0.08 ± 55%      -0.0        0.08 ± 23%      +0.0        0.10 ± 13%  perf-profile.children.cycles-pp.path_mount
> >       0.06 ± 58%      -0.0        0.06 ± 47%      -0.0        0.04 ±104%      -0.0        0.06 ± 10%  perf-profile.children.cycles-pp.rwsem_wake
> >       0.10 ± 35%      -0.0        0.10 ± 28%      -0.0        0.09 ± 26%      -0.1        0.05 ± 55%  perf-profile.children.cycles-pp.arch_scale_freq_tick
> >       1.08 ± 17%      -0.0        1.07 ±  9%      -0.0        1.04 ±  7%      -0.1        1.01 ±  5%  perf-profile.children.cycles-pp.vfs_statx
> >       0.05 ± 53%      -0.0        0.04 ± 72%      -0.0        0.03 ±100%      -0.0        0.05 ± 52%  perf-profile.children.cycles-pp.__mnt_want_write
> >       0.05 ± 56%      -0.0        0.04 ± 73%      -0.0        0.05 ± 51%      +0.0        0.07 ± 23%  perf-profile.children.cycles-pp.lookup_constant
> >       0.05 ± 92%      -0.0        0.04 ± 75%      +0.0        0.07 ± 15%      +0.0        0.05 ± 50%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
> >       0.10 ± 28%      -0.0        0.09 ± 19%      -0.0        0.08 ± 20%      -0.0        0.09 ±  9%  perf-profile.children.cycles-pp._hashmap_iterate
> >       0.06 ± 54%      -0.0        0.05 ± 49%      -0.0        0.05 ± 46%      -0.0        0.04 ± 53%  perf-profile.children.cycles-pp.__x64_sys_readlink
> >       0.12 ± 24%      -0.0        0.11 ± 17%      +0.0        0.13 ± 18%      -0.0        0.11 ± 15%  perf-profile.children.cycles-pp.lockref_get
> >       0.21 ± 14%      -0.0        0.20 ± 12%      +0.0        0.22 ± 11%      +0.0        0.21 ±  5%  perf-profile.children.cycles-pp.__switch_to
> >       1.33 ± 16%      -0.0        1.32 ±  8%      -0.0        1.29 ±  5%      -0.1        1.27 ±  3%  perf-profile.children.cycles-pp.vfs_fstatat
> >       0.14 ± 43%      -0.0        0.13 ± 17%      -0.0        0.12 ± 23%      -0.0        0.13 ± 19%  perf-profile.children.cycles-pp.memdup_user
> >       0.05 ± 53%      -0.0        0.04 ± 75%      -0.0        0.04 ± 71%      -0.0        0.04 ± 82%  perf-profile.children.cycles-pp.copy_from_kernel_nofault
> >       0.09 ± 23%      -0.0        0.08 ± 25%      +0.0        0.09 ± 12%      -0.0        0.08 ± 50%  perf-profile.children.cycles-pp.chacha_block_generic
> >       0.12 ± 33%      -0.0        0.11 ± 27%      -0.0        0.11 ± 14%      +0.0        0.13 ± 20%  perf-profile.children.cycles-pp._get_random_bytes
> >       0.15 ± 39%      -0.0        0.14 ± 15%      +0.0        0.15 ± 21%      +0.0        0.16 ± 20%  perf-profile.children.cycles-pp.memcg_init_list_lru_one
> >       0.06 ± 53%      -0.0        0.06 ± 53%      -0.0        0.05 ± 48%      +0.0        0.07 ± 18%  perf-profile.children.cycles-pp.kernfs_fop_open
> >       0.04 ± 88%      -0.0        0.04 ± 73%      -0.0        0.03 ±100%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp._copy_to_iter
> >       0.98 ± 22%      -0.0        0.98 ±  8%      +0.0        1.01 ±  6%      -0.0        0.98 ±  7%  perf-profile.children.cycles-pp.__do_sys_newlstat
> >       0.19 ± 31%      -0.0        0.18 ± 11%      -0.0        0.18 ± 21%      +0.0        0.19 ± 13%  perf-profile.children.cycles-pp._copy_from_user
> >       0.83 ± 21%      -0.0        0.82 ±  4%      -0.0        0.80 ± 10%      -0.1        0.75 ±  8%  perf-profile.children.cycles-pp.alloc_empty_file
> >       0.22 ± 24%      -0.0        0.21 ± 28%      -0.0        0.21 ± 13%      +0.0        0.24 ± 11%  perf-profile.children.cycles-pp.srcu_funnel_gp_start
> >       0.24 ± 22%      -0.0        0.23 ± 16%      -0.0        0.22 ±  7%      -0.0        0.23 ± 12%  perf-profile.children.cycles-pp.seq_escape_mem
> >       0.10 ± 29%      -0.0        0.09 ± 31%      -0.0        0.10 ± 41%      +0.0        0.10 ± 24%  perf-profile.children.cycles-pp.generic_exec_single
> >       0.16 ± 10%      -0.0        0.15 ± 12%      +0.0        0.16 ± 20%      -0.0        0.15 ± 19%  perf-profile.children.cycles-pp.terminate_walk
> >       0.20 ± 35%      -0.0        0.19 ± 21%      +0.0        0.21 ± 19%      +0.0        0.22 ± 16%  perf-profile.children.cycles-pp.ramfs_mknod
> >       0.15 ± 11%      -0.0        0.14 ± 12%      +0.0        0.16 ± 30%      -0.0        0.13 ± 16%  perf-profile.children.cycles-pp.update_rq_clock_task
> >       0.67 ± 23%      -0.0        0.66 ±  8%      -0.0        0.65 ±  9%      +0.0        0.69 ±  7%  perf-profile.children.cycles-pp.__do_sys_newfstat
> >       0.14 ± 20%      -0.0        0.13 ± 29%      -0.0        0.12 ± 48%      -0.0        0.11 ±  9%  perf-profile.children.cycles-pp.rcu_pending
> >       0.16 ± 27%      -0.0        0.15 ± 13%      +0.0        0.16 ± 13%      +0.0        0.16 ± 28%  perf-profile.children.cycles-pp.___perf_sw_event
> >       0.07 ± 53%      -0.0        0.06 ± 46%      +0.0        0.08 ± 29%      +0.0        0.08 ± 24%  perf-profile.children.cycles-pp.folio_alloc
> >       0.06 ± 62%      -0.0        0.05 ± 47%      -0.0        0.04 ± 73%      -0.0        0.05 ± 50%  perf-profile.children.cycles-pp.shmem_unlink
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.01 ±200%  perf-profile.children.cycles-pp.malloc@plt
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.mntput
> >       0.12 ± 46%      -0.0        0.12 ± 12%      -0.0        0.12 ± 18%      +0.0        0.13 ± 17%  perf-profile.children.cycles-pp.change_mnt_propagation
> >       0.08 ± 12%      -0.0        0.08 ±  8%      +0.0        0.10 ± 14%      -0.0        0.08 ± 24%  perf-profile.children.cycles-pp.schedule_preempt_disabled
> >       0.33 ± 33%      -0.0        0.33 ± 19%      +0.0        0.36 ± 16%      -0.0        0.32 ± 12%  perf-profile.children.cycles-pp.shmem_alloc_inode
> >       0.39 ± 22%      -0.0        0.39 ± 12%      -0.0        0.38 ± 12%      -0.0        0.36 ±  5%  perf-profile.children.cycles-pp.d_alloc
> >       0.05 ± 53%      -0.0        0.05 ± 71%      -0.0        0.05 ± 46%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.rb_erase
> >       0.02 ±123%      -0.0        0.02 ±141%      +0.0        0.07 ± 50%      +0.0        0.03 ±127%  perf-profile.children.cycles-pp.os_xsave
> >       0.12 ± 22%      -0.0        0.12 ± 25%      +0.0        0.13 ± 18%      +0.0        0.13 ± 20%  perf-profile.children.cycles-pp.idle_cpu
> >       0.06 ± 14%      -0.0        0.06 ± 47%      -0.0        0.06 ± 15%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.prepend_copy
> >       0.36 ± 28%      -0.0        0.36 ± 10%      +0.0        0.40 ± 10%      +0.1        0.44 ± 12%  perf-profile.children.cycles-pp.list_lru_destroy
> >       0.16 ± 17%      -0.0        0.15 ± 14%      -0.0        0.15 ± 15%      -0.0        0.14 ± 14%  perf-profile.children.cycles-pp.task_work_add
> >       0.26 ± 17%      -0.0        0.25 ± 17%      -0.0        0.25 ± 15%      -0.0        0.23 ±  7%  perf-profile.children.cycles-pp.sched_clock_cpu
> >       0.34 ± 23%      -0.0        0.33 ±  6%      -0.0        0.33 ± 11%      +0.0        0.37 ±  5%  perf-profile.children.cycles-pp.get_nr_dirty_inodes
> >       0.11 ± 27%      -0.0        0.10 ± 20%      +0.0        0.11 ± 15%      +0.0        0.13 ± 19%  perf-profile.children.cycles-pp.destroy_inode
> >       0.05 ± 86%      -0.0        0.04 ± 72%      -0.0        0.03 ±105%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.exp_funnel_lock
> >       0.07 ± 53%      -0.0        0.06 ± 47%      -0.0        0.06 ± 50%      -0.0        0.05 ± 53%  perf-profile.children.cycles-pp.sock_alloc_send_pskb
> >       0.07 ± 63%      -0.0        0.06 ± 21%      +0.0        0.07 ± 23%      +0.0        0.08 ± 17%  perf-profile.children.cycles-pp.mnt_release_group_id
> >       0.14 ± 24%      -0.0        0.13 ± 14%      -0.0        0.12 ± 28%      -0.0        0.11 ± 18%  perf-profile.children.cycles-pp.vfs_getattr_nosec
> >       0.19 ± 24%      -0.0        0.18 ± 13%      -0.0        0.17 ± 14%      +0.0        0.19 ± 19%  perf-profile.children.cycles-pp.show_type
> >       0.08 ± 51%      -0.0        0.07 ± 21%      +0.0        0.08 ± 17%      -0.0        0.05 ± 51%  perf-profile.children.cycles-pp.kernfs_fop_release
> >       0.14 ± 31%      -0.0        0.13 ± 20%      +0.0        0.15 ± 23%      -0.0        0.12 ± 30%  perf-profile.children.cycles-pp.xas_create
> >       0.04 ± 89%      -0.0        0.04 ± 72%      +0.0        0.06 ± 55%      -0.0        0.03 ±122%  perf-profile.children.cycles-pp.shuffle_freelist
> >       0.03 ± 82%      -0.0        0.03 ±101%      +0.0        0.04 ± 71%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.build_open_flags
> >       0.07 ± 52%      -0.0        0.07 ± 48%      +0.0        0.09 ± 23%      +0.0        0.08 ± 20%  perf-profile.children.cycles-pp.xas_descend
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.handle_mm_fault
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.__handle_mm_fault
> >       0.15 ± 16%      -0.0        0.15 ± 16%      +0.0        0.16 ± 18%      +0.0        0.16 ± 18%  perf-profile.children.cycles-pp.syscall_return_via_sysret
> >       0.10 ± 22%      -0.0        0.10 ±  7%      -0.0        0.09 ± 21%      -0.0        0.09 ± 14%  perf-profile.children.cycles-pp.__srcu_read_lock
> >       0.16 ± 14%      -0.0        0.16 ± 14%      -0.0        0.14 ± 20%      -0.0        0.15 ± 14%  perf-profile.children.cycles-pp.prepend_path
> >       0.09 ± 15%      -0.0        0.09 ± 41%      -0.0        0.08 ± 50%      -0.0        0.08 ±  9%  perf-profile.children.cycles-pp._find_next_and_bit
> >       0.09 ± 33%      -0.0        0.09 ± 29%      -0.0        0.08 ± 37%      -0.0        0.09 ± 32%  perf-profile.children.cycles-pp.select_task_rq
> >       0.08 ± 22%      -0.0        0.08 ± 31%      +0.0        0.09 ± 14%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
> >       0.28 ± 23%      -0.0        0.28 ± 16%      +0.0        0.30 ±  9%      +0.0        0.29 ±  9%  perf-profile.children.cycles-pp.generic_permission
> >       0.06 ± 54%      -0.0        0.06 ±  9%      +0.0        0.06 ± 47%      -0.0        0.04 ± 50%  perf-profile.children.cycles-pp.m_start
> >       0.79 ± 31%      -0.0        0.78 ± 15%      +0.1        0.84 ± 15%      +0.0        0.81 ± 18%  perf-profile.children.cycles-pp.alloc_inode
> >       0.04 ± 85%      -0.0        0.04 ± 71%      -0.0        0.02 ±141%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.copyout
> >       0.07 ± 24%      -0.0        0.06 ± 46%      -0.0        0.04 ±109%      -0.0        0.05 ± 50%  perf-profile.children.cycles-pp.pick_next_entity
> >       0.09 ± 29%      -0.0        0.08 ± 14%      -0.0        0.08 ± 19%      +0.0        0.09 ± 18%  perf-profile.children.cycles-pp.security_inode_permission
> >       0.27 ± 22%      -0.0        0.26 ± 10%      -0.0        0.26 ± 17%      +0.0        0.27 ± 14%  perf-profile.children.cycles-pp.get_obj_cgroup_from_current
> >       0.29 ± 18%      -0.0        0.28 ± 12%      +0.0        0.30 ± 16%      +0.0        0.31 ± 11%  perf-profile.children.cycles-pp.lockref_put_return
> >       0.59 ± 26%      -0.0        0.59 ± 12%      +0.0        0.64 ± 12%      +0.0        0.63 ± 16%  perf-profile.children.cycles-pp.__sync_rcu_exp_select_node_cpus
> >       0.16 ± 17%      -0.0        0.16 ± 16%      -0.0        0.15 ± 19%      -0.0        0.15 ± 16%  perf-profile.children.cycles-pp.__d_path
> >       0.05 ± 54%      -0.0        0.05 ± 49%      -0.0        0.04 ± 79%      -0.0        0.05 ± 52%  perf-profile.children.cycles-pp.readlink_copy
> >       0.08 ± 51%      -0.0        0.08 ± 29%      +0.0        0.09 ± 24%      +0.0        0.11 ± 20%  perf-profile.children.cycles-pp.crng_make_state
> >       0.12 ± 23%      -0.0        0.12 ± 18%      -0.0        0.10 ± 25%      -0.0        0.11 ± 25%  perf-profile.children.cycles-pp.pcpu_block_update_hint_free
> >       0.03 ± 82%      -0.0        0.03 ±101%      -0.0        0.02 ± 99%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp._IO_feof
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.unit_name_escape
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.04 ± 83%  perf-profile.children.cycles-pp.__put_mountpoint
> >       0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.exc_page_fault
> >       0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.do_user_addr_fault
> >       0.02 ±123%      -0.0        0.02 ±144%      +0.0        0.03 ±100%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.__radix_tree_lookup
> >       0.02 ±123%      -0.0        0.02 ±144%      +0.0        0.04 ± 73%      +0.0        0.04 ± 53%  perf-profile.children.cycles-pp.should_failslab
> >       0.14 ± 27%      -0.0        0.14 ± 12%      -0.0        0.13 ± 22%      +0.0        0.15 ± 26%  perf-profile.children.cycles-pp.rcu_segcblist_enqueue
> >       0.14 ± 21%      -0.0        0.14 ± 20%      +0.0        0.14 ± 20%      -0.0        0.12 ± 26%  perf-profile.children.cycles-pp.__get_obj_cgroup_from_memcg
> >       3.02 ± 15%      -0.0        3.02 ± 11%      +0.2        3.21 ± 14%      -0.0        3.01 ±  7%  perf-profile.children.cycles-pp.schedule
> >       0.06 ± 55%      -0.0        0.06 ± 49%      -0.0        0.05 ± 50%      -0.0        0.03 ± 82%  perf-profile.children.cycles-pp.__alloc_skb
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.timerqueue_del
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.children.cycles-pp.unit_type_from_string
> >       0.02 ±122%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.uncharge_batch
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.place_entity
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.seq_release_private
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.ramfs_parse_param
> >       0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.propagate_mount_unlock
> >       0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.proc_self_get_link
> >       0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.touch_atime
> >       0.16 ± 29%      -0.0        0.16 ± 26%      +0.0        0.16 ± 18%      +0.0        0.17 ± 14%  perf-profile.children.cycles-pp.queue_delayed_work_on
> >       0.34 ± 33%      -0.0        0.34 ± 14%      +0.0        0.36 ± 16%      +0.0        0.34 ± 24%  perf-profile.children.cycles-pp.xas_store
> >       0.79 ± 29%      -0.0        0.79 ± 12%      +0.1        0.86 ± 14%      +0.1        0.89 ± 13%  perf-profile.children.cycles-pp.propagate_mount_busy
> >       0.06 ± 58%      -0.0        0.06 ± 48%      +0.0        0.09 ± 17%      +0.0        0.06 ± 52%  perf-profile.children.cycles-pp.propagation_next
> >       0.08 ± 59%      -0.0        0.08 ± 25%      -0.0        0.08 ± 25%      -0.0        0.07 ± 25%  perf-profile.children.cycles-pp.xa_load
> >       0.08 ± 61%      -0.0        0.08 ± 24%      -0.0        0.08 ± 19%      +0.0        0.10 ± 25%  perf-profile.children.cycles-pp.shmem_parse_one
> >       0.21 ± 20%      -0.0        0.20 ± 13%      -0.0        0.18 ± 20%      -0.0        0.18 ±  4%  perf-profile.children.cycles-pp.strchr
> >       0.10 ± 25%      -0.0        0.10 ± 19%      -0.0        0.07 ± 10%      -0.0        0.07 ± 53%  perf-profile.children.cycles-pp.swake_up_one
> >       0.11 ± 24%      -0.0        0.10 ± 16%      +0.0        0.11 ± 27%      +0.0        0.12 ± 16%  perf-profile.children.cycles-pp.__memset
> >       0.06 ± 56%      -0.0        0.06 ± 47%      -0.0        0.05 ± 51%      -0.0        0.03 ± 82%  perf-profile.children.cycles-pp.alloc_skb_with_frags
> >       0.06 ± 54%      -0.0        0.06 ± 52%      +0.0        0.08 ± 31%      +0.0        0.08 ± 24%  perf-profile.children.cycles-pp.folio_batch_move_lru
> >       0.08 ± 51%      -0.0        0.08 ± 25%      +0.0        0.08 ± 20%      +0.0        0.10 ± 25%  perf-profile.children.cycles-pp.crng_fast_key_erasure
> >       0.17 ± 23%      -0.0        0.16 ± 10%      +0.0        0.20 ± 22%      -0.0        0.16 ± 16%  perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
> >       0.03 ±123%      -0.0        0.02 ± 99%      +0.0        0.03 ±101%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp._dbus_first_type_in_signature
> >       0.23 ± 30%      -0.0        0.23 ± 11%      -0.0        0.23 ± 11%      -0.0        0.22 ± 12%  perf-profile.children.cycles-pp.__close_nocancel
> >       0.20 ± 33%      -0.0        0.20 ± 22%      +0.0        0.22 ± 13%      +0.0        0.23 ± 18%  perf-profile.children.cycles-pp.__list_del_entry_valid
> >       2.21 ± 16%      -0.0        2.21 ±  4%      -0.0        2.17 ±  5%      -0.1        2.12 ±  3%  perf-profile.children.cycles-pp.filename_lookup
> >       0.10 ± 32%      -0.0        0.10 ± 25%      -0.0        0.10 ± 29%      -0.0        0.08 ± 13%  perf-profile.children.cycles-pp.__d_add
> >       0.29 ± 36%      -0.0        0.29 ± 11%      -0.0        0.29 ± 13%      -0.0        0.29 ± 17%  perf-profile.children.cycles-pp.vfs_unlink
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.mount_too_revealing
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp._ordered_hashmap_ensure_allocated
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__x64_sys_exit_group
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.bprm_execve
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.do_group_exit
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.do_exit
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.exec_binprm
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.search_binary_handler
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.load_elf_binary
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.stress_mwc1
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.rcu_exp_jiffies_till_stall_check
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__seq_open_private
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.seq_open_private
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__x64_sys_poll
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.apparmor_sb_mount
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.do_sys_poll
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.from_kuid_munged
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.locks_remove_posix
> >       0.24 ± 18%      +0.0        0.24 ± 13%      +0.0        0.24 ± 11%      +0.0        0.26 ±  4%  perf-profile.children.cycles-pp.strlen
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__fsnotify_parent
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.free_and_strdup
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.simple_strntoull
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.hrtimer_get_next_event
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.memparse
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.tick_nohz_tick_stopped
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.asm_sysvec_irq_work
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.sysvec_irq_work
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__sysvec_irq_work
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.irq_work_run
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.irq_work_single
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp._printk
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.vprintk_emit
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.console_unlock
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.console_flush_all
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.sched_clock
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.sprintf
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.read_counters
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__x64_sys_connect
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__sys_connect
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.check_cfs_rq_runtime
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__traverse_mounts
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.__put_super
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.i_callback
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.security_inode_init_security
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.default_send_IPI_single_phys
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.insert_work
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.xas_find_marked
> >       0.02 ±122%      +0.0        0.02 ±141%      +0.0        0.03 ±100%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.local_clock
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.wake_up_bit
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.vmap_pages_pud_range
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.alloc_pages
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.simple_unlink
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.free_unref_page_list
> >       0.02 ±122%      +0.0        0.02 ±144%      +0.0        0.03 ±100%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.__unfreeze_partials
> >       0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.__bitmap_set
> >       0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.cmd_stat
> >       0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.ihold
> >       0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.dispatch_events
> >       0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.process_interval
> >       0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.__calc_delta
> >       0.01 ±200%      +0.0        0.01 ±223%      +0.0        0.03 ±102%      +0.0        0.04 ± 85%  perf-profile.children.cycles-pp.__mod_memcg_lruvec_state
> >       0.00            +0.0        0.00            +0.0        0.02 ±144%      +0.0        0.00        perf-profile.children.cycles-pp.cpu_stopper_thread
> >       0.00            +0.0        0.00            +0.0        0.02 ± 99%      +0.0        0.00        perf-profile.children.cycles-pp.invent_group_ids
> >       0.00            +0.0        0.00            +0.0        0.02 ± 99%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.clear_page_erms
> >       0.37 ± 22%      +0.0        0.37 ±  9%      -0.0        0.34 ±  7%      -0.0        0.33 ± 11%  perf-profile.children.cycles-pp.init_file
> >       0.52 ± 24%      +0.0        0.52 ± 11%      -0.0        0.50 ± 16%      -0.1        0.46 ± 10%  perf-profile.children.cycles-pp.rdrand
> >       0.18 ± 36%      +0.0        0.18 ± 21%      -0.0        0.17 ± 23%      -0.0        0.17 ± 15%  perf-profile.children.cycles-pp.strndup_user
> >       0.12 ± 27%      +0.0        0.12 ± 18%      +0.0        0.12 ± 27%      +0.0        0.12 ± 12%  perf-profile.children.cycles-pp.fput
> >       2.10 ± 25%      +0.0        2.10 ±  9%      -0.0        2.08 ± 13%      -0.1        2.00 ± 10%  perf-profile.children.cycles-pp.openat64
> >       0.02 ±125%      +0.0        0.02 ± 99%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.children.cycles-pp.inode_maybe_inc_iversion
> >       0.08 ± 54%      +0.0        0.08 ± 24%      +0.0        0.09 ± 22%      +0.0        0.11 ± 18%  perf-profile.children.cycles-pp.uuid_gen
> >       0.01 ±200%      +0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.inode_sb_list_add
> >       0.20 ± 36%      +0.0        0.20 ±  9%      -0.0        0.19 ± 25%      +0.0        0.22 ± 10%  perf-profile.children.cycles-pp.commit_tree
> >       0.26 ± 33%      +0.0        0.26 ± 11%      +0.0        0.30 ±  5%      +0.0        0.29 ± 11%  perf-profile.children.cycles-pp.kernfs_iop_permission
> >       0.11 ± 16%      +0.0        0.11 ± 19%      -0.0        0.10 ± 21%      -0.0        0.10 ±  9%  perf-profile.children.cycles-pp.strcmp
> >       0.01 ±200%      +0.0        0.01 ±223%      -0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.dbus_message_get_interface
> >       0.01 ±200%      +0.0        0.01 ±223%      -0.0        0.00            +0.0        0.02 ±123%  perf-profile.children.cycles-pp.ep_item_poll
> >       0.09 ± 58%      +0.0        0.09 ± 14%      +0.0        0.10 ±  7%      +0.0        0.12 ± 16%  perf-profile.children.cycles-pp.shmem_parse_options
> >       0.13 ± 31%      +0.0        0.13 ± 17%      +0.0        0.14 ± 18%      +0.0        0.14 ± 21%  perf-profile.children.cycles-pp._hashmap_first_key_and_value
> >       0.15 ± 35%      +0.0        0.15 ± 13%      +0.0        0.16 ± 18%      +0.0        0.16 ± 16%  perf-profile.children.cycles-pp.siphash24_init
> >       0.10 ± 21%      +0.0        0.10 ± 25%      +0.0        0.10 ± 13%      +0.0        0.12 ± 22%  perf-profile.children.cycles-pp.__destroy_inode
> >       0.04 ± 83%      +0.0        0.04 ± 71%      -0.0        0.00            +0.0        0.04 ± 83%  perf-profile.children.cycles-pp.xas_clear_mark
> >       0.07 ± 67%      +0.0        0.08 ± 14%      -0.0        0.06 ± 46%      -0.0        0.05 ± 53%  perf-profile.children.cycles-pp.string_table_lookup
> >       0.14 ± 25%      +0.0        0.15 ± 24%      +0.0        0.15 ± 16%      +0.0        0.16 ± 20%  perf-profile.children.cycles-pp.security_inode_getattr
> >       0.18 ± 30%      +0.0        0.19 ± 14%      +0.0        0.21 ± 18%      +0.0        0.23 ± 11%  perf-profile.children.cycles-pp.ida_free
> >       0.06 ± 57%      +0.0        0.06 ± 19%      -0.0        0.06 ± 75%      -0.0        0.06 ± 21%  perf-profile.children.cycles-pp._hashmap_clear
> >       0.16 ± 30%      +0.0        0.16 ± 21%      +0.0        0.19 ± 17%      +0.0        0.16 ± 12%  perf-profile.children.cycles-pp.__percpu_counter_init
> >       0.17 ± 36%      +0.0        0.18 ± 15%      +0.0        0.19 ± 16%      +0.0        0.20 ± 11%  perf-profile.children.cycles-pp.__kmalloc
> >       0.36 ± 16%      +0.0        0.36 ± 11%      -0.0        0.34 ± 14%      +0.0        0.39 ±  9%  perf-profile.children.cycles-pp.__d_lookup_rcu
> >       0.21 ± 24%      +0.0        0.21 ± 13%      -0.0        0.19 ± 12%      -0.0        0.20 ± 15%  perf-profile.children.cycles-pp.string_escape_mem
> >       0.06 ± 61%      +0.0        0.06 ± 52%      +0.0        0.07 ± 16%      +0.0        0.06 ± 54%  perf-profile.children.cycles-pp.delete_from_page_cache_batch
> >       0.04 ± 90%      +0.0        0.04 ± 73%      +0.0        0.08 ± 20%      +0.0        0.07 ± 28%  perf-profile.children.cycles-pp.set_anon_super_fc
> >       0.13 ± 30%      +0.0        0.13 ± 20%      -0.0        0.11 ± 20%      +0.0        0.13 ± 25%  perf-profile.children.cycles-pp.up_write
> >       0.24 ± 36%      +0.0        0.24 ± 18%      +0.1        0.29 ± 17%      +0.0        0.26 ± 16%  perf-profile.children.cycles-pp.shrink_dcache_for_umount
> >       0.22 ± 28%      +0.0        0.22 ± 15%      -0.0        0.22 ± 10%      -0.0        0.20 ± 11%  perf-profile.children.cycles-pp.number
> >       0.14 ± 18%      +0.0        0.14 ± 10%      +0.0        0.15 ± 10%      +0.0        0.16 ± 13%  perf-profile.children.cycles-pp.mutex_unlock
> >       0.06 ± 51%      +0.0        0.07 ± 30%      +0.0        0.07 ± 13%      -0.0        0.06 ± 51%  perf-profile.children.cycles-pp.chacha_permute
> >       0.01 ±200%      +0.0        0.02 ±141%      -0.0        0.00            -0.0        0.01 ±200%  perf-profile.children.cycles-pp.simple_write_end
> >       0.01 ±200%      +0.0        0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.02 ±125%  perf-profile.children.cycles-pp.__rdgsbase_inactive
> >       0.06 ± 51%      +0.0        0.07 ± 53%      +0.0        0.07 ± 18%      +0.0        0.07 ± 23%  perf-profile.children.cycles-pp.mnt_want_write
> >       0.06 ± 82%      +0.0        0.07 ± 47%      +0.0        0.08 ± 20%      +0.0        0.09 ± 25%  perf-profile.children.cycles-pp.zero_user_segments
> >       0.01 ±200%      +0.0        0.02 ±141%      +0.0        0.05 ± 46%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.d_delete
> >       0.01 ±200%      +0.0        0.02 ±141%      +0.0        0.05 ± 48%      +0.0        0.04 ± 83%  perf-profile.children.cycles-pp.update_min_vruntime
> >       0.02 ±123%      +0.0        0.03 ±100%      -0.0        0.00            -0.0        0.01 ±200%  perf-profile.children.cycles-pp.m_next
> >       0.03 ± 82%      +0.0        0.04 ± 73%      +0.0        0.05 ± 45%      -0.0        0.01 ±200%  perf-profile.children.cycles-pp.__hrtimer_next_event_base
> >       0.15 ± 25%      +0.0        0.16 ± 19%      +0.0        0.15 ± 24%      +0.0        0.17 ± 13%  perf-profile.children.cycles-pp.copy_mount_options
> >       0.07 ± 56%      +0.0        0.08 ± 35%      +0.0        0.10 ± 20%      +0.0        0.09 ± 18%  perf-profile.children.cycles-pp.free@plt
> >       0.11 ± 20%      +0.0        0.12 ± 14%      +0.0        0.12 ± 21%      +0.0        0.12 ± 13%  perf-profile.children.cycles-pp.refill_obj_stock
> >       0.13 ± 32%      +0.0        0.14 ± 16%      -0.0        0.12 ± 26%      -0.0        0.11 ± 12%  perf-profile.children.cycles-pp.simple_lookup
> >       0.10 ± 32%      +0.0        0.10 ± 12%      +0.0        0.10 ± 16%      +0.0        0.10 ± 11%  perf-profile.children.cycles-pp.iput
> >       0.03 ±122%      +0.0        0.03 ±111%      +0.0        0.05 ± 74%      +0.0        0.05 ± 52%  perf-profile.children.cycles-pp.kmalloc_slab
> >       0.04 ± 83%      +0.0        0.04 ± 71%      -0.0        0.01 ±223%      -0.0        0.02 ±123%  perf-profile.children.cycles-pp.wake_up_q
> >       0.04 ± 85%      +0.0        0.04 ± 73%      +0.0        0.04 ± 72%      +0.0        0.04 ± 82%  perf-profile.children.cycles-pp.__fs_parse
> >       0.04 ± 87%      +0.0        0.04 ± 75%      -0.0        0.03 ±101%      +0.0        0.05 ± 53%  perf-profile.children.cycles-pp.synchronize_srcu
> >       0.01 ±200%      +0.0        0.02 ±141%      +0.0        0.02 ±144%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.find_lock_entries
> >       0.07 ± 60%      +0.0        0.08 ± 28%      +0.0        0.08 ± 22%      -0.0        0.06 ± 12%  perf-profile.children.cycles-pp.shmem_file_read_iter
> >       0.09 ± 25%      +0.0        0.10 ± 18%      +0.0        0.10 ± 11%      +0.0        0.10 ± 19%  perf-profile.children.cycles-pp._IO_default_xsputn
> >       0.07 ± 57%      +0.0        0.08 ± 42%      +0.0        0.08 ± 36%      +0.0        0.07 ± 87%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
> >       0.06 ± 57%      +0.0        0.07 ± 49%      +0.0        0.07 ± 14%      -0.0        0.06 ± 12%  perf-profile.children.cycles-pp.rcu_exp_handler
> >       0.19 ± 21%      +0.0        0.20 ± 15%      +0.0        0.20 ± 21%      +0.0        0.23 ± 24%  perf-profile.children.cycles-pp.__filemap_get_folio
> >       0.01 ±200%      +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.autofs_show_options
> >       0.02 ±122%      +0.0        0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.children.cycles-pp.note_gp_changes
> >       0.28 ± 28%      +0.0        0.28 ± 20%      +0.0        0.30 ± 18%      +0.0        0.29 ±  7%  perf-profile.children.cycles-pp.set_next_entity
> >       0.10 ± 23%      +0.0        0.10 ± 18%      -0.0        0.09 ± 15%      +0.0        0.11 ± 26%  perf-profile.children.cycles-pp.filemap_add_folio
> >       0.07 ± 57%      +0.0        0.07 ± 10%      +0.0        0.09 ± 33%      -0.0        0.06 ± 54%  perf-profile.children.cycles-pp.xas_alloc
> >       0.11 ± 25%      +0.0        0.12 ± 28%      +0.0        0.12 ± 15%      +0.0        0.12 ± 18%  perf-profile.children.cycles-pp.realloc
> >       0.01 ±200%      +0.0        0.02 ±146%      +0.0        0.03 ±101%      -0.0        0.00        perf-profile.children.cycles-pp.check_cpu_stall
> >       0.06 ± 50%      +0.0        0.07 ± 45%      +0.0        0.08 ± 21%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.__lookup_slow
> >       0.11 ± 38%      +0.0        0.12 ± 23%      +0.0        0.12 ± 23%      +0.0        0.12 ± 14%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
> >       0.06 ± 85%      +0.0        0.07 ± 20%      +0.0        0.08 ± 30%      -0.0        0.06 ± 56%  perf-profile.children.cycles-pp.stress_ramfs_child
> >       1.14 ± 25%      +0.0        1.15 ±  9%      +0.0        1.17 ±  6%      -0.0        1.13 ±  6%  perf-profile.children.cycles-pp.__lxstat64
> >       0.03 ± 81%      +0.0        0.04 ± 75%      +0.0        0.04 ± 45%      +0.0        0.07 ± 23%  perf-profile.children.cycles-pp.strscpy
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.memcmp@plt
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.copy_msghdr_from_user
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.genuine_random_bytes
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.available_idle_cpu
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.put_cpu_partial
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.set_strjoin
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.cap_capable
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.mnt_table_next_fs
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.do_mmap
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.ksys_write
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.vfs_write
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.vm_mmap_pgoff
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.mmap_region
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.ct_kernel_exit
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.string
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.from_kgid_munged
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.pick_file
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±200%  perf-profile.children.cycles-pp.security_sb_mount
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.02 ±123%  perf-profile.children.cycles-pp.mnt_reset_fs
> >       0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.strdup@plt
> >       0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.rcu_sync_dtor
> >       0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp._IO_link_in
> >       0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.security_path_mknod
> >       0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.lru_add_fn
> >       0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.x86_pmu_disable
> >       0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.call_cpuidle
> >       0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.00        perf-profile.children.cycles-pp.devpts_show_options
> >       0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.switch_fpu_return
> >       0.00            +0.0        0.01 ±223%      +0.0        0.03 ±101%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__vmap_pages_range_noflush
> >       0.01 ±200%      +0.0        0.02 ±142%      +0.0        0.05 ± 46%      +0.0        0.02 ±122%  perf-profile.children.cycles-pp.hrtimer_update_next_event
> >       0.17 ± 27%      +0.0        0.18 ± 11%      +0.0        0.17 ± 10%      -0.0        0.15 ±  9%  perf-profile.children.cycles-pp.apparmor_file_alloc_security
> >       0.12 ± 56%      +0.0        0.13 ± 18%      -0.0        0.11 ± 20%      -0.0        0.11 ± 26%  perf-profile.children.cycles-pp.strlcat
> >       0.05 ± 53%      +0.0        0.06 ± 47%      +0.0        0.07 ± 15%      +0.0        0.05 ± 55%  perf-profile.children.cycles-pp.rcu_nocb_try_bypass
> >       0.05 ± 84%      +0.0        0.06 ± 50%      +0.0        0.08 ± 22%      -0.0        0.05 ± 90%  perf-profile.children.cycles-pp.d_set_mounted
> >       0.24 ±109%      +0.0        0.25 ± 91%      -0.0        0.21 ±133%      +0.0        0.27 ± 89%  perf-profile.children.cycles-pp.irq_enter_rcu
> >       0.33 ± 32%      +0.0        0.34 ± 17%      +0.0        0.33 ± 13%      +0.0        0.34 ±  9%  perf-profile.children.cycles-pp.__kmalloc_node_track_caller
> >       0.07 ± 53%      +0.0        0.08 ± 26%      -0.0        0.03 ±100%      -0.0        0.04 ± 85%  perf-profile.children.cycles-pp.switch_mm_irqs_off
> >       0.10 ± 37%      +0.0        0.10 ± 20%      +0.0        0.11 ± 18%      +0.0        0.12 ± 22%  perf-profile.children.cycles-pp.ramfs_mkdir
> >       0.23 ±114%      +0.0        0.24 ± 92%      -0.0        0.19 ±145%      +0.0        0.26 ± 91%  perf-profile.children.cycles-pp.tick_irq_enter
> >       0.06 ± 30%      +0.0        0.07 ± 25%      +0.0        0.08 ± 57%      +0.0        0.06 ± 12%  perf-profile.children.cycles-pp.chase_symlinks
> >       0.03 ± 82%      +0.0        0.04 ± 71%      -0.0        0.03 ±100%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.memcg_account_kmem
> >       0.06 ± 12%      +0.0        0.07 ± 20%      -0.0        0.05 ± 73%      -0.0        0.05 ± 51%  perf-profile.children.cycles-pp.security_file_open
> >       0.09 ± 81%      +0.0        0.10 ± 19%      +0.0        0.10 ± 22%      +0.0        0.12 ± 26%  perf-profile.children.cycles-pp.may_delete
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.set_cached_acl
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.pcpu_chunk_relocate
> >       0.01 ±200%      +0.0        0.02 ±144%      +0.0        0.02 ±143%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.vmalloc_to_page
> >       0.00            +0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.pick_link
> >       0.00            +0.0        0.01 ±223%      +0.0        0.04 ±101%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.clear_inode
> >       0.23 ± 20%      +0.0        0.24 ± 14%      -0.0        0.22 ± 19%      -0.0        0.22 ± 12%  perf-profile.children.cycles-pp.pcpu_free_area
> >       0.08 ± 51%      +0.0        0.09 ± 23%      +0.0        0.10 ± 21%      +0.0        0.11 ± 15%  perf-profile.children.cycles-pp.lockref_put_or_lock
> >       0.19 ± 30%      +0.0        0.20 ± 13%      +0.0        0.20 ± 10%      -0.0        0.19 ± 20%  perf-profile.children.cycles-pp.prepare_task_switch
> >       0.66 ± 29%      +0.0        0.67 ± 15%      +0.0        0.69 ± 18%      +0.0        0.67 ±  7%  perf-profile.children.cycles-pp.lookup_open
> >       0.06 ± 58%      +0.0        0.07 ± 14%      +0.0        0.07 ± 14%      +0.0        0.06 ± 50%  perf-profile.children.cycles-pp.d_instantiate
> >       0.03 ±123%      +0.0        0.04 ± 71%      -0.0        0.02 ±146%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.seq_dentry
> >       0.29 ± 16%      +0.0        0.30 ± 24%      +0.0        0.32 ±  9%      +0.0        0.31 ± 14%  perf-profile.children.cycles-pp._raw_spin_lock_irq
> >       0.07 ± 57%      +0.0        0.08 ± 28%      +0.0        0.10 ± 31%      +0.0        0.08 ± 15%  perf-profile.children.cycles-pp.shmem_put_super
> >       0.16 ± 23%      +0.0        0.18 ±  5%      +0.0        0.17 ±  9%      +0.0        0.20 ± 11%  perf-profile.children.cycles-pp.get_nr_inodes
> >       0.27 ± 14%      +0.0        0.28 ± 10%      +0.0        0.28 ± 10%      -0.0        0.26 ±  9%  perf-profile.children.cycles-pp.native_sched_clock
> >       0.04 ± 85%      +0.0        0.05 ± 49%      -0.0        0.02 ±144%      -0.0        0.03 ±127%  perf-profile.children.cycles-pp.select_task_rq_fair
> >       0.10 ± 28%      +0.0        0.11 ± 10%      -0.0        0.10 ± 26%      +0.0        0.11 ± 25%  perf-profile.children.cycles-pp.add_uevent_var
> >       0.07 ± 25%      +0.0        0.08 ± 20%      +0.0        0.07 ± 21%      -0.0        0.05 ± 56%  perf-profile.children.cycles-pp.map_id_up
> >       0.70 ± 28%      +0.0        0.71 ± 16%      +0.0        0.71 ± 16%      -0.0        0.70 ±  8%  perf-profile.children.cycles-pp.filename_create
> >       0.27 ± 25%      +0.0        0.28 ± 17%      +0.1        0.32 ± 13%      +0.1        0.32 ± 17%  perf-profile.children.cycles-pp.__switch_to_asm
> >       0.11 ± 36%      +0.0        0.12 ± 17%      +0.0        0.12 ± 29%      +0.0        0.11 ± 17%  perf-profile.children.cycles-pp.shmem_evict_inode
> >       0.13 ± 33%      +0.0        0.14 ±  9%      -0.0        0.12 ± 18%      +0.0        0.14 ±  7%  perf-profile.children.cycles-pp.seq_puts
> >       1.86 ± 23%      +0.0        1.87 ± 10%      -0.2        1.70 ± 13%      -0.1        1.76 ±  8%  perf-profile.children.cycles-pp.show_mountinfo
> >       1.43 ± 23%      +0.0        1.45 ±  7%      -0.1        1.36 ± 14%      -0.1        1.34 ±  7%  perf-profile.children.cycles-pp.siphash24_compress
> >       0.13 ± 22%      +0.0        0.15 ± 12%      -0.0        0.12 ± 21%      -0.0        0.13 ± 19%  perf-profile.children.cycles-pp.alloc_fd
> >       0.01 ±200%      +0.0        0.03 ±100%      +0.0        0.04 ±103%      +0.1        0.07 ± 12%  perf-profile.children.cycles-pp.__bitmap_clear
> >       0.09 ± 39%      +0.0        0.11 ± 40%      -0.0        0.08 ± 58%      +0.0        0.09 ± 18%  perf-profile.children.cycles-pp.llist_add_batch
> >       0.06 ± 59%      +0.0        0.08 ± 27%      +0.0        0.09 ± 32%      +0.0        0.07 ± 19%  perf-profile.children.cycles-pp.percpu_counter_destroy
> >       0.01 ±200%      +0.0        0.02 ±145%      +0.0        0.03 ±100%      +0.0        0.03 ± 81%  perf-profile.children.cycles-pp.path_compare@plt
> >       0.07 ± 57%      +0.0        0.08 ± 44%      -0.0        0.07 ± 16%      -0.0        0.06 ± 12%  perf-profile.children.cycles-pp.path_hash_func
> >       0.08 ± 23%      +0.0        0.10 ± 16%      +0.0        0.08 ± 11%      +0.0        0.11 ± 26%  perf-profile.children.cycles-pp.__filemap_add_folio
> >       0.03 ± 81%      +0.0        0.04 ± 73%      -0.0        0.00            +0.0        0.05 ± 51%  perf-profile.children.cycles-pp.cpuacct_charge
> >       0.10 ± 26%      +0.0        0.11 ± 14%      -0.0        0.10 ± 24%      +0.0        0.11 ± 23%  perf-profile.children.cycles-pp.hashmap_replace
> >       0.05 ± 52%      +0.0        0.06 ± 17%      +0.0        0.05 ± 47%      -0.0        0.04 ± 50%  perf-profile.children.cycles-pp.kmemdup_nul
> >       0.04 ± 82%      +0.0        0.05 ± 71%      +0.0        0.06 ± 46%      +0.0        0.05 ± 52%  perf-profile.children.cycles-pp._raw_read_lock_irqsave
> >       0.07 ± 61%      +0.0        0.08 ± 16%      -0.0        0.06 ± 45%      +0.0        0.09 ± 30%  perf-profile.children.cycles-pp.strcspn@plt
> >       0.04 ± 83%      +0.0        0.05 ± 47%      +0.0        0.06 ± 47%      +0.0        0.04 ± 50%  perf-profile.children.cycles-pp.shmem_free_in_core_inode
> >       0.65 ± 19%      +0.0        0.66 ± 15%      +0.0        0.67 ± 13%      +0.0        0.68 ± 12%  perf-profile.children.cycles-pp.memcg_slab_post_alloc_hook
> >       0.05 ± 82%      +0.0        0.07 ± 15%      +0.0        0.10 ± 42%      +0.0        0.08 ± 52%  perf-profile.children.cycles-pp.prealloc_shrinker
> >       0.11 ± 20%      +0.0        0.13 ± 15%      +0.0        0.12 ±  6%      +0.0        0.14 ± 17%  perf-profile.children.cycles-pp.kernfs_get_target_path
> >       0.05 ± 81%      +0.0        0.07 ± 14%      +0.0        0.09 ± 43%      +0.0        0.08 ± 51%  perf-profile.children.cycles-pp.__prealloc_shrinker
> >       0.07 ± 57%      +0.0        0.09 ± 17%      +0.0        0.10 ± 25%      +0.0        0.08 ± 25%  perf-profile.children.cycles-pp.allocate_slab
> >       0.09 ± 57%      +0.0        0.10 ± 18%      +0.0        0.10 ± 30%      +0.0        0.13 ± 14%  perf-profile.children.cycles-pp.release_pages
> >       0.01 ±200%      +0.0        0.02 ± 99%      +0.0        0.02 ±143%      -0.0        0.00        perf-profile.children.cycles-pp.strnlen_user
> >       0.24 ± 17%      +0.0        0.26 ± 18%      +0.0        0.26 ± 13%      +0.0        0.27 ± 12%  perf-profile.children.cycles-pp.update_curr
> >       0.18 ± 20%      +0.0        0.19 ± 16%      +0.0        0.18 ± 21%      +0.0        0.22 ± 24%  perf-profile.children.cycles-pp.pagecache_get_page
> >       0.11 ± 38%      +0.0        0.12 ± 40%      -0.0        0.10 ± 33%      +0.0        0.11 ± 22%  perf-profile.children.cycles-pp.__smp_call_single_queue
> >       0.05 ± 52%      +0.0        0.06 ± 11%      +0.0        0.05 ± 47%      +0.0        0.05 ± 53%  perf-profile.children.cycles-pp.vscnprintf
> >       0.09 ± 29%      +0.0        0.10 ± 26%      +0.0        0.10 ± 19%      +0.0        0.10 ± 20%  perf-profile.children.cycles-pp.string_hash_func
> >       0.53 ± 33%      +0.0        0.55 ± 17%      +0.1        0.59 ± 20%      +0.0        0.54 ± 15%  perf-profile.children.cycles-pp.rwsem_optimistic_spin
> >       0.06 ± 58%      +0.0        0.08 ± 23%      +0.0        0.07 ± 15%      +0.0        0.07 ± 33%  perf-profile.children.cycles-pp.path_simplify
> >       0.12 ± 27%      +0.0        0.14 ± 11%      +0.0        0.14 ± 17%      +0.0        0.14 ± 22%  perf-profile.children.cycles-pp.dev_uevent
> >       1.00 ± 15%      +0.0        1.02 ± 13%      +0.0        1.04 ±  6%      +0.0        1.01 ±  8%  perf-profile.children.cycles-pp.__cond_resched
> >       0.03 ± 82%      +0.0        0.05 ± 77%      +0.0        0.06 ± 11%      +0.0        0.04 ± 50%  perf-profile.children.cycles-pp.strlcpy
> >       0.00            +0.0        0.02 ±141%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.kernfs_unlink_open_file
> >       0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.d_same_name
> >       0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.resched_curr
> >       0.04 ± 88%      +0.0        0.06 ± 49%      +0.0        0.04 ± 73%      -0.0        0.04 ± 83%  perf-profile.children.cycles-pp.btrfs_show_options
> >       0.01 ±200%      +0.0        0.03 ±100%      +0.0        0.03 ±102%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__rw_verify_area
> >       0.05 ± 90%      +0.0        0.06 ± 46%      +0.0        0.07 ± 54%      -0.0        0.02 ±122%  perf-profile.children.cycles-pp.tick_sched_do_timer
> >       0.56 ± 26%      +0.0        0.58 ± 15%      +0.0        0.59 ± 17%      +0.0        0.61 ± 13%  perf-profile.children.cycles-pp.vfs_create_mount
> >       0.01 ±200%      +0.0        0.03 ±101%      +0.0        0.03 ±101%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.apparmor_file_open
> >       0.16 ± 17%      +0.0        0.18 ± 22%      +0.0        0.17 ± 28%      +0.0        0.17 ± 14%  perf-profile.children.cycles-pp.update_rq_clock
> >       3.71 ± 16%      +0.0        3.73 ±  4%      +0.1        3.76 ±  9%      -0.1        3.64 ±  2%  perf-profile.children.cycles-pp.path_openat
> >       0.00            +0.0        0.02 ±142%      +0.0        0.00            +0.0        0.00        perf-profile.children.cycles-pp.cgroup_show_path
> >       0.00            +0.0        0.02 ±142%      +0.0        0.00            +0.0        0.04 ± 51%  perf-profile.children.cycles-pp.cgroup_rstat_updated
> >       0.09 ± 28%      +0.0        0.11 ± 19%      +0.0        0.10 ± 14%      +0.0        0.10 ± 17%  perf-profile.children.cycles-pp.make_vfsuid
> >       3.80 ± 16%      +0.0        3.82 ±  4%      +0.0        3.85 ±  9%      -0.1        3.71 ±  2%  perf-profile.children.cycles-pp.do_filp_open
> >       0.44 ± 24%      +0.0        0.46 ± 11%      +0.0        0.45 ± 16%      +0.1        0.52 ± 17%  perf-profile.children.cycles-pp.ramfs_symlink
> >       0.33 ± 19%      +0.0        0.34 ± 19%      +0.0        0.36 ± 17%      +0.0        0.36 ±  7%  perf-profile.children.cycles-pp.check_heap_object
> >       0.15 ± 32%      +0.0        0.16 ± 16%      +0.0        0.16 ± 37%      +0.0        0.17 ± 17%  perf-profile.children.cycles-pp.wq_worker_sleeping
> >       0.12 ± 24%      +0.0        0.14 ± 17%      +0.0        0.14 ± 13%      +0.0        0.13 ± 10%  perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
> >       0.02 ±122%      +0.0        0.04 ±104%      +0.0        0.04 ± 71%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.__libc_calloc
> >       0.00            +0.0        0.02 ±141%      +0.0        0.05 ± 45%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.__alloc_pages_bulk
> >       0.00            +0.0        0.02 ±141%      +0.0        0.05 ± 46%      +0.0        0.02 ±125%  perf-profile.children.cycles-pp.__vmalloc_area_node
> >       0.06 ± 58%      +0.0        0.08 ± 16%      +0.0        0.06 ± 51%      +0.0        0.07 ± 12%  perf-profile.children.cycles-pp.dentry_unlink_inode
> >       1.99 ± 24%      +0.0        2.01 ± 10%      +0.2        2.16 ± 10%      +0.2        2.23 ± 10%  perf-profile.children.cycles-pp.deactivate_locked_super
> >       0.13 ± 21%      +0.0        0.15 ± 15%      -0.0        0.12 ± 25%      +0.0        0.15 ± 12%  perf-profile.children.cycles-pp.check_preempt_curr
> >       0.09 ± 25%      +0.0        0.12 ± 12%      -0.0        0.09 ± 21%      -0.0        0.09 ± 19%  perf-profile.children.cycles-pp.d_walk
> >       0.16 ± 33%      +0.0        0.18 ± 11%      +0.0        0.18 ± 17%      +0.0        0.20 ± 11%  perf-profile.children.cycles-pp.lockref_get_not_dead
> >       0.73 ± 22%      +0.0        0.75 ± 13%      +0.1        0.79 ±  9%      +0.1        0.79 ±  5%  perf-profile.children.cycles-pp.__check_object_size
> >       0.00            +0.0        0.02 ±142%      +0.1        0.06 ± 45%      +0.0        0.04 ± 53%  perf-profile.children.cycles-pp.__vmalloc_node
> >       0.00            +0.0        0.02 ±142%      +0.1        0.06 ± 45%      +0.0        0.04 ± 53%  perf-profile.children.cycles-pp.pcpu_alloc_chunk
> >       0.58 ± 37%      +0.0        0.60 ± 17%      +0.0        0.62 ± 20%      +0.0        0.61 ± 13%  perf-profile.children.cycles-pp.shmem_get_inode
> >       0.05 ± 54%      +0.0        0.07 ± 11%      +0.0        0.06 ± 47%      +0.0        0.05 ± 53%  perf-profile.children.cycles-pp.sysfs_emit_at
> >       0.05 ± 53%      +0.0        0.07 ± 11%      +0.0        0.07 ± 14%      +0.0        0.07 ±  7%  perf-profile.children.cycles-pp.path_startswith
> >       0.59 ± 24%      +0.0        0.61 ± 11%      +0.0        0.61 ± 15%      +0.1        0.64 ± 14%  perf-profile.children.cycles-pp.delayed_free_vfsmnt
> >       0.65 ± 25%      +0.0        0.67 ±  5%      +0.0        0.67 ± 17%      +0.0        0.67 ± 15%  perf-profile.children.cycles-pp.__slab_free
> >       0.06 ± 53%      +0.0        0.08 ± 15%      +0.0        0.07 ± 47%      +0.0        0.08 ± 26%  perf-profile.children.cycles-pp.memcpy@plt
> >       0.09 ± 34%      +0.0        0.11 ± 14%      +0.0        0.12 ± 15%      +0.0        0.12 ±  3%  perf-profile.children.cycles-pp.lookup_dcache
> >       0.07 ± 55%      +0.0        0.10 ± 15%      -0.0        0.06 ± 49%      +0.0        0.08 ± 13%  perf-profile.children.cycles-pp.path_equal
> >       0.25 ± 28%      +0.0        0.28 ± 14%      +0.0        0.26 ± 19%      +0.1        0.31 ± 20%  perf-profile.children.cycles-pp.simple_write_begin
> >       0.27 ± 36%      +0.0        0.30 ±  9%      +0.0        0.29 ±  9%      +0.0        0.30 ±  8%  perf-profile.children.cycles-pp.__check_heap_object
> >       0.05 ± 55%      +0.0        0.08 ± 24%      +0.0        0.09 ± 27%      +0.0        0.09 ± 27%  perf-profile.children.cycles-pp.lru_add_drain_cpu
> >       0.01 ±200%      +0.0        0.04 ±101%      +0.0        0.02 ±142%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.unlock_mount
> >       0.05 ± 90%      +0.0        0.07 ± 12%      -0.0        0.03 ±100%      -0.0        0.04 ± 82%  perf-profile.children.cycles-pp.unit_file_find_dropin_paths
> >       0.08 ± 53%      +0.0        0.10 ± 22%      +0.0        0.09 ±  9%      +0.0        0.10 ± 18%  perf-profile.children.cycles-pp.apparmor_file_free_security
> >       0.09 ± 52%      +0.0        0.11 ± 22%      +0.0        0.10 ± 17%      +0.0        0.10 ± 17%  perf-profile.children.cycles-pp.security_file_free
> >       0.35 ± 33%      +0.0        0.37 ± 18%      +0.0        0.39 ± 17%      +0.0        0.37 ±  7%  perf-profile.children.cycles-pp.lookup_one_qstr_excl
> >       0.12 ± 32%      +0.0        0.14 ± 27%      +0.0        0.14 ± 16%      +0.0        0.12 ± 12%  perf-profile.children.cycles-pp.propagate_umount
> >       0.03 ±123%      +0.0        0.05 ± 46%      +0.0        0.06 ± 47%      +0.0        0.06 ±  6%  perf-profile.children.cycles-pp.__d_instantiate
> >       0.04 ± 87%      +0.0        0.06 ± 16%      +0.0        0.05 ± 71%      +0.0        0.07 ± 15%  perf-profile.children.cycles-pp.shmem_getattr
> >       2.53 ± 25%      +0.0        2.56 ± 16%      +0.1        2.66 ± 10%      +0.3        2.81 ± 13%  perf-profile.children.cycles-pp.attach_recursive_mnt
> >       0.17 ± 28%      +0.0        0.20 ± 12%      +0.0        0.19 ± 13%      +0.0        0.19 ± 13%  perf-profile.children.cycles-pp._find_next_zero_bit
> >       0.08 ± 59%      +0.0        0.10 ± 13%      +0.0        0.09 ± 27%      +0.0        0.11 ± 14%  perf-profile.children.cycles-pp.check_preempt_wakeup
> >       0.19 ± 22%      +0.0        0.22 ± 12%      +0.0        0.21 ± 17%      +0.0        0.20 ± 16%  perf-profile.children.cycles-pp.obj_cgroup_charge
> >       0.01 ±200%      +0.0        0.04 ± 71%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.children.cycles-pp.filemap_get_entry
> >       0.18 ± 27%      +0.0        0.21 ± 29%      +0.0        0.20 ± 14%      +0.0        0.20 ±  9%  perf-profile.children.cycles-pp.__virt_addr_valid
> >       0.01 ±200%      +0.0        0.04 ± 75%      +0.0        0.02 ±142%      +0.0        0.02 ±123%  perf-profile.children.cycles-pp.strextend_with_separator
> >       0.05 ± 82%      +0.0        0.08 ± 37%      +0.0        0.08 ± 16%      +0.1        0.11 ± 13%  perf-profile.children.cycles-pp.put_fs_context
> >       0.14 ± 24%      +0.0        0.17 ± 15%      +0.0        0.16 ± 27%      +0.0        0.16 ± 13%  perf-profile.children.cycles-pp.filp_close
> >       0.04 ± 93%      +0.0        0.07 ± 22%      +0.0        0.05 ± 78%      +0.0        0.07 ± 24%  perf-profile.children.cycles-pp.shmem_undo_range
> >       0.00            +0.0        0.03 ±100%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.children.cycles-pp.wq_worker_running
> >       0.11 ± 19%      +0.0        0.14 ± 11%      +0.0        0.12 ± 12%      +0.0        0.12 ± 15%  perf-profile.children.cycles-pp.memcpy_orig
> >       0.33 ± 28%      +0.0        0.36 ± 14%      +0.0        0.33 ± 18%      +0.1        0.39 ± 21%  perf-profile.children.cycles-pp.page_symlink
> >       0.14 ± 25%      +0.0        0.16 ±  4%      +0.0        0.14 ± 17%      +0.1        0.19 ± 11%  perf-profile.children.cycles-pp.kfree
> >       0.63 ± 29%      +0.0        0.65 ± 17%      +0.1        0.70 ± 15%      +0.0        0.67 ±  8%  perf-profile.children.cycles-pp.evict
> >       0.04 ± 83%      +0.0        0.06 ± 25%      +0.0        0.08 ± 15%      +0.0        0.07 ± 12%  perf-profile.children.cycles-pp.pcpu_next_fit_region
> >       0.29 ± 37%      +0.0        0.32 ± 13%      -0.0        0.29 ± 13%      +0.0        0.31 ± 14%  perf-profile.children.cycles-pp.complete_walk
> >       0.10 ± 39%      +0.0        0.13 ± 21%      +0.0        0.12 ± 15%      +0.0        0.15 ± 24%  perf-profile.children.cycles-pp.mutex_lock_killable
> >       0.22 ± 18%      +0.0        0.25 ± 12%      +0.0        0.23 ± 12%      +0.0        0.25 ± 17%  perf-profile.children.cycles-pp.kernfs_iop_get_link
> >       0.11 ± 24%      +0.0        0.14 ± 24%      +0.0        0.13 ± 30%      +0.0        0.14 ± 12%  perf-profile.children.cycles-pp.inode_init_always
> >       0.07 ± 55%      +0.0        0.10 ± 23%      +0.0        0.08 ± 29%      +0.0        0.10 ± 17%  perf-profile.children.cycles-pp.show_mnt_opts
> >       0.01 ±200%      +0.0        0.04 ± 75%      +0.0        0.03 ±100%      +0.0        0.04 ± 51%  perf-profile.children.cycles-pp.get_partial_node
> >       0.00            +0.0        0.03 ±102%      +0.1        0.06 ± 56%      +0.0        0.03 ± 82%  perf-profile.children.cycles-pp.pcpu_map_pages
> >       0.62 ± 25%      +0.0        0.65 ± 18%      +0.1        0.67 ± 14%      +0.1        0.70 ±  9%  perf-profile.children.cycles-pp.do_rmdir
> >       0.26 ± 26%      +0.0        0.28 ±  5%      +0.0        0.28 ± 16%      +0.0        0.28 ± 19%  perf-profile.children.cycles-pp.sysfs_kf_seq_show
> >       0.15 ± 41%      +0.0        0.18 ± 17%      +0.0        0.19 ± 18%      +0.0        0.16 ± 20%  perf-profile.children.cycles-pp.shmem_symlink
> >       0.08 ± 56%      +0.0        0.11 ± 17%      +0.0        0.12 ± 23%      +0.0        0.11 ± 22%  perf-profile.children.cycles-pp.__list_add_valid
> >       0.57 ± 32%      +0.0        0.60 ± 16%      +0.1        0.64 ± 19%      +0.0        0.60 ± 17%  perf-profile.children.cycles-pp.rwsem_down_write_slowpath
> >       0.12 ± 40%      +0.0        0.15 ± 21%      +0.0        0.13 ± 17%      +0.0        0.15 ± 11%  perf-profile.children.cycles-pp.synchronize_rcu_expedited_wait
> >       0.05 ± 83%      +0.0        0.08 ± 10%      +0.0        0.08 ± 17%      +0.0        0.07 ± 16%  perf-profile.children.cycles-pp._atomic_dec_and_lock
> >       0.00            +0.0        0.03 ±101%      +0.1        0.06 ± 45%      +0.0        0.04 ± 53%  perf-profile.children.cycles-pp.pcpu_create_chunk
> >       0.00            +0.0        0.03 ±101%      +0.1        0.06 ± 45%      +0.0        0.04 ± 53%  perf-profile.children.cycles-pp.__vmalloc_node_range
> >       0.66 ± 27%      +0.0        0.69 ± 13%      +0.1        0.74 ± 14%      +0.1        0.71 ± 11%  perf-profile.children.cycles-pp.do_mkdirat
> >       0.16 ± 21%      +0.0        0.19 ± 25%      +0.0        0.18 ± 12%      +0.0        0.17 ± 17%  perf-profile.children.cycles-pp.put_prev_entity
> >       0.84 ± 25%      +0.0        0.88 ± 16%      -0.0        0.84 ± 16%      +0.1        0.90 ± 12%  perf-profile.children.cycles-pp.stress_mwc32
> >       0.10 ± 40%      +0.0        0.13 ± 21%      +0.0        0.11 ± 20%      +0.0        0.11 ± 15%  perf-profile.children.cycles-pp.synchronize_rcu_expedited_wait_once
> >       0.01 ±200%      +0.0        0.04 ± 71%      +0.0        0.05 ± 50%      +0.1        0.07 ± 11%  perf-profile.children.cycles-pp.ktime_get_mono_fast_ns
> >       0.31 ± 28%      +0.0        0.34 ± 18%      +0.0        0.34 ± 15%      +0.0        0.35 ±  4%  perf-profile.children.cycles-pp.rcu_exp_wait_wake
> >       0.52 ± 18%      +0.0        0.55 ± 12%      +0.0        0.55 ± 11%      +0.0        0.54 ± 11%  perf-profile.children.cycles-pp.__call_rcu_common
> >       0.34 ± 19%      +0.0        0.37 ± 12%      -0.0        0.34 ±  9%      -0.0        0.33 ± 11%  perf-profile.children.cycles-pp.access
> >       0.59 ± 21%      +0.0        0.62 ±  6%      +0.0        0.62 ± 11%      +0.0        0.63 ±  5%  perf-profile.children.cycles-pp.step_into
> >       0.07 ± 63%      +0.0        0.10 ± 30%      -0.0        0.06 ± 48%      +0.0        0.07 ± 20%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
> >       0.01 ±200%      +0.0        0.05 ± 47%      +0.0        0.06 ± 23%      +0.0        0.06 ± 23%  perf-profile.children.cycles-pp.__kmalloc_node
> >       0.24 ± 14%      +0.0        0.28 ±  9%      +0.0        0.26 ± 12%      +0.0        0.25 ± 22%  perf-profile.children.cycles-pp.kernfs_dop_revalidate
> >       1.47 ± 28%      +0.0        1.50 ± 13%      +0.2        1.63 ± 10%      +0.2        1.71 ±  7%  perf-profile.children.cycles-pp._find_next_bit
> >       0.11 ± 28%      +0.0        0.14 ± 23%      +0.0        0.12 ± 30%      +0.0        0.13 ± 10%  perf-profile.children.cycles-pp.alloc_fs_context
> >       0.49 ± 30%      +0.0        0.52 ± 19%      +0.0        0.54 ± 19%      +0.0        0.53 ± 12%  perf-profile.children.cycles-pp.__flush_work
> >       0.73 ± 27%      +0.0        0.76 ± 11%      +0.1        0.82 ± 12%      +0.1        0.79 ± 12%  perf-profile.children.cycles-pp.__x64_sys_mkdir
> >       0.18 ± 29%      +0.0        0.22 ±  9%      -0.0        0.18 ± 21%      +0.0        0.19 ±  6%  perf-profile.children.cycles-pp.strchr@plt
> >       0.10 ± 21%      +0.0        0.14 ± 27%      +0.0        0.13 ± 21%      +0.0        0.14 ± 20%  perf-profile.children.cycles-pp.__strdup
> >       0.03 ±123%      +0.0        0.06 ± 21%      +0.0        0.05 ± 49%      +0.0        0.05 ± 53%  perf-profile.children.cycles-pp.percpu_counter_add_batch
> >       0.33 ± 33%      +0.0        0.36 ± 16%      +0.0        0.36 ± 14%      +0.1        0.38 ±  5%  perf-profile.children.cycles-pp.truncate_inode_pages_range
> >       0.08 ± 27%      +0.0        0.11 ± 13%      +0.0        0.12 ± 30%      +0.0        0.11 ± 13%  perf-profile.children.cycles-pp._raw_spin_trylock
> >       0.14 ± 28%      +0.0        0.18 ± 17%      +0.0        0.16 ± 23%      +0.0        0.14 ± 27%  perf-profile.children.cycles-pp.device_read_uevent_file
> >       0.24 ± 24%      +0.0        0.28 ±  5%      +0.0        0.26 ± 15%      +0.0        0.27 ± 21%  perf-profile.children.cycles-pp.dev_attr_show
> >       0.70 ± 25%      +0.0        0.74 ± 16%      +0.1        0.75 ± 15%      +0.1        0.78 ± 12%  perf-profile.children.cycles-pp.unregister_shrinker
> >       0.53 ± 25%      +0.0        0.56 ±  9%      -0.0        0.53 ± 15%      +0.0        0.53 ± 11%  perf-profile.children.cycles-pp.device_read_db_internal_filename
> >       0.32 ± 20%      +0.0        0.36 ± 11%      +0.0        0.33 ±  9%      -0.0        0.31 ± 10%  perf-profile.children.cycles-pp.do_faccessat
> >       0.02 ±200%      +0.0        0.05 ± 49%      +0.0        0.02 ±144%      +0.0        0.04 ± 82%  perf-profile.children.cycles-pp.simple_acl_create
> >       0.30 ± 27%      +0.0        0.34 ± 22%      +0.0        0.32 ± 20%      +0.0        0.34 ± 11%  perf-profile.children.cycles-pp.vfs_rmdir
> >       0.12 ± 44%      +0.0        0.16 ± 12%      +0.1        0.17 ± 17%      +0.0        0.15 ± 21%  perf-profile.children.cycles-pp.shmem_mkdir
> >       0.14 ± 25%      +0.0        0.18 ±  9%      +0.0        0.18 ± 21%      +0.0        0.17 ± 16%  perf-profile.children.cycles-pp.get_mountpoint
> >       1.75 ± 23%      +0.0        1.79 ± 17%      +0.1        1.82 ± 12%      +0.1        1.88 ± 11%  perf-profile.children.cycles-pp.namespace_unlock
> >       0.23 ± 23%      +0.0        0.27 ±  5%      +0.0        0.26 ± 16%      +0.0        0.27 ± 22%  perf-profile.children.cycles-pp.uevent_show
> >       0.31 ± 23%      +0.0        0.35 ±  9%      +0.0        0.32 ± 10%      +0.0        0.34 ± 16%  perf-profile.children.cycles-pp.vfs_readlink
> >       0.65 ± 22%      +0.0        0.69 ± 12%      -0.0        0.61 ± 16%      -0.0        0.64 ±  6%  perf-profile.children.cycles-pp.seq_printf
> >       1.45 ± 19%      +0.0        1.49 ±  6%      +0.1        1.56 ±  7%      +0.1        1.54 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock
> >       0.49 ± 30%      +0.0        0.53 ± 15%      +0.1        0.54 ± 13%      +0.1        0.55 ± 10%  perf-profile.children.cycles-pp.umount_tree
> >       0.29 ± 21%      +0.0        0.34 ± 17%      +0.1        0.38 ± 10%      +0.1        0.40 ± 11%  perf-profile.children.cycles-pp.ida_alloc_range
> >       3.72 ± 26%      +0.0        3.76 ± 14%      +0.2        3.94 ± 13%      +0.3        4.05 ± 11%  perf-profile.children.cycles-pp.path_umount
> >       0.21 ± 23%      +0.0        0.25 ± 11%      +0.0        0.22 ± 18%      +0.0        0.21 ± 22%  perf-profile.children.cycles-pp.device_properties_prepare
> >       0.39 ± 20%      +0.0        0.43 ± 14%      +0.1        0.44 ± 16%      +0.0        0.42 ± 16%  perf-profile.children.cycles-pp.enqueue_entity
> >       0.03 ±124%      +0.0        0.07 ± 48%      +0.0        0.05 ± 77%      +0.0        0.06 ± 18%  perf-profile.children.cycles-pp.file_free_rcu
> >       0.15 ± 27%      +0.0        0.19 ± 18%      +0.0        0.16 ± 35%      +0.0        0.16 ± 27%  perf-profile.children.cycles-pp.flush_smp_call_function_queue
> >       0.34 ± 16%      +0.0        0.39 ± 10%      +0.0        0.37 ± 15%      +0.0        0.39 ± 13%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
> >       0.22 ± 37%      +0.0        0.26 ± 18%      +0.0        0.24 ± 12%      +0.0        0.26 ± 15%  perf-profile.children.cycles-pp.kstrdup
> >       0.14 ± 35%      +0.0        0.18 ± 18%      +0.0        0.16 ± 22%      +0.1        0.19 ± 13%  perf-profile.children.cycles-pp.__pagevec_release
> >       0.43 ± 33%      +0.0        0.48 ± 10%      +0.0        0.47 ± 17%      -0.0        0.41 ± 15%  perf-profile.children.cycles-pp.siphash24_finalize
> >       0.94 ± 10%      +0.0        0.98 ±  4%      -0.0        0.94 ± 14%      +0.0        0.98 ±  6%  perf-profile.children.cycles-pp.lookup_fast
> >       0.07 ± 25%      +0.0        0.12 ± 39%      +0.0        0.10 ± 41%      +0.0        0.10 ± 30%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
> >       0.99 ± 19%      +0.0        1.04 ±  5%      +0.0        1.01 ±  7%      +0.0        1.04 ±  6%  perf-profile.children.cycles-pp.__fxstat64
> >       0.69 ± 25%      +0.0        0.74 ± 18%      +0.1        0.76 ± 15%      +0.1        0.77 ± 11%  perf-profile.children.cycles-pp.__x64_sys_rmdir
> >       0.12 ± 28%      +0.0        0.16 ± 20%      +0.0        0.12 ± 27%      +0.0        0.13 ± 20%  perf-profile.children.cycles-pp.sched_ttwu_pending
> >       3.33 ± 26%      +0.0        3.38 ± 15%      +0.2        3.55 ± 13%      +0.3        3.63 ± 11%  perf-profile.children.cycles-pp.do_umount
> >       0.09 ± 33%      +0.0        0.14 ± 16%      +0.0        0.14 ± 14%      +0.0        0.14 ± 18%  perf-profile.children.cycles-pp.strlen@plt
> >       0.11 ± 38%      +0.0        0.16 ± 17%      +0.1        0.18 ± 20%      +0.1        0.17 ±  7%  perf-profile.children.cycles-pp.d_lookup
> >       0.04 ± 83%      +0.0        0.08 ± 21%      -0.0        0.03 ±101%      +0.0        0.07 ± 25%  perf-profile.children.cycles-pp.shrink_dcache_parent
> >       0.74 ± 30%      +0.0        0.78 ± 16%      +0.0        0.78 ± 13%      +0.1        0.84 ± 14%  perf-profile.children.cycles-pp.path_parentat
> >       0.80 ± 29%      +0.0        0.85 ± 15%      +0.0        0.85 ± 12%      +0.1        0.92 ± 13%  perf-profile.children.cycles-pp.__filename_parentat
> >       0.06 ± 51%      +0.1        0.11 ± 11%      +0.0        0.10 ± 16%      +0.0        0.10 ± 20%  perf-profile.children.cycles-pp.close_fd
> >       2.39 ± 23%      +0.1        2.44 ±  9%      -0.1        2.26 ± 13%      -0.1        2.31 ±  9%  perf-profile.children.cycles-pp.seq_read_iter
> >       0.30 ± 41%      +0.1        0.36 ± 16%      +0.1        0.36 ± 18%      +0.0        0.34 ± 14%  perf-profile.children.cycles-pp.shmem_mknod
> >       1.08 ± 10%      +0.1        1.13 ±  4%      +0.0        1.09 ± 12%      +0.0        1.13 ±  6%  perf-profile.children.cycles-pp.walk_component
> >       1.61 ± 32%      +0.1        1.66 ± 10%      +0.1        1.72 ± 12%      +0.2        1.77 ± 12%  perf-profile.children.cycles-pp.unlink
> >       0.55 ± 22%      +0.1        0.60 ±  3%      +0.0        0.56 ± 12%      +0.0        0.57 ± 10%  perf-profile.children.cycles-pp.__entry_text_start
> >       0.70 ± 31%      +0.1        0.75 ± 16%      +0.1        0.77 ± 18%      +0.0        0.73 ± 15%  perf-profile.children.cycles-pp.down_write
> >       2.59 ± 24%      +0.1        2.64 ±  9%      -0.1        2.48 ± 13%      -0.1        2.48 ±  7%  perf-profile.children.cycles-pp.ksys_read
> >       0.56 ± 24%      +0.1        0.62 ± 16%      +0.1        0.62 ± 19%      +0.1        0.64 ± 11%  perf-profile.children.cycles-pp.__synchronize_srcu
> >       0.37 ± 21%      +0.1        0.42 ±  7%      +0.0        0.39 ± 20%      +0.0        0.38 ± 12%  perf-profile.children.cycles-pp.cfree
> >       0.53 ± 18%      +0.1        0.58 ± 10%      +0.1        0.60 ± 15%      +0.0        0.56 ± 13%  perf-profile.children.cycles-pp.enqueue_task_fair
> >       0.88 ± 25%      +0.1        0.93 ± 15%      +0.1        0.93 ± 11%      +0.1        0.96 ± 13%  perf-profile.children.cycles-pp.sync_rcu_exp_select_cpus
> >       0.26 ± 38%      +0.1        0.32 ± 10%      +0.1        0.35 ± 12%      +0.0        0.31 ± 20%  perf-profile.children.cycles-pp.vfs_mkdir
> >       2.53 ± 16%      +0.1        2.59 ±  5%      +0.1        2.63 ±  7%      +0.1        2.60        perf-profile.children.cycles-pp.link_path_walk
> >       0.19 ± 27%      +0.1        0.25 ± 16%      +0.0        0.23 ± 11%      +0.0        0.22 ± 14%  perf-profile.children.cycles-pp.percpu_free_rwsem
> >       0.00            +0.1        0.06 ± 52%      +0.1        0.08 ± 19%      +0.1        0.06 ± 53%  perf-profile.children.cycles-pp.init_timer_key
> >       0.22 ± 26%      +0.1        0.27 ± 22%      -0.0        0.21 ± 22%      +0.0        0.23 ±  6%  perf-profile.children.cycles-pp.device_add_property_aux
> >       0.80 ± 27%      +0.1        0.85 ± 14%      +0.1        0.86 ± 17%      +0.1        0.86 ±  9%  perf-profile.children.cycles-pp.open_last_lookups
> >       0.43 ± 31%      +0.1        0.48 ± 13%      +0.1        0.50 ± 15%      +0.0        0.44 ± 21%  perf-profile.children.cycles-pp.do_lock_mount
> >       0.18 ± 31%      +0.1        0.24 ± 20%      +0.0        0.20 ± 20%      +0.0        0.20 ± 15%  perf-profile.children.cycles-pp.__legitimize_mnt
> >       0.78 ± 26%      +0.1        0.84 ± 12%      +0.1        0.88 ± 12%      +0.1        0.85 ± 12%  perf-profile.children.cycles-pp.mkdir
> >       0.54 ± 27%      +0.1        0.60 ±  8%      +0.0        0.56 ± 15%      -0.0        0.53 ±  8%  perf-profile.children.cycles-pp.path_compare
> >       2.80 ± 25%      +0.1        2.86 ±  8%      -0.0        2.80 ± 13%      -0.1        2.73 ±  9%  perf-profile.children.cycles-pp.device_set_syspath
> >       0.17 ± 15%      +0.1        0.22 ± 39%      +0.0        0.20 ± 24%      +0.1        0.23 ± 23%  perf-profile.children.cycles-pp.complete
> >       2.57 ± 24%      +0.1        2.63 ±  9%      -0.1        2.45 ± 13%      -0.1        2.46 ±  8%  perf-profile.children.cycles-pp.vfs_read
> >       0.19 ± 27%      +0.1        0.25 ± 16%      +0.0        0.23 ± 11%      +0.0        0.22 ± 14%  perf-profile.children.cycles-pp.destroy_super_work
> >       0.88 ± 25%      +0.1        0.94 ± 16%      +0.1        0.94 ± 12%      +0.1        0.97 ± 13%  perf-profile.children.cycles-pp.wait_rcu_exp_gp
> >       0.52 ± 22%      +0.1        0.58 ± 10%      +0.0        0.57 ± 13%      +0.0        0.55 ± 15%  perf-profile.children.cycles-pp.free_percpu
> >       0.26 ± 20%      +0.1        0.32 ± 13%      -0.0        0.26 ± 21%      +0.0        0.28 ± 11%  perf-profile.children.cycles-pp.format_decode
> >       5.39 ± 26%      +0.1        5.45 ± 14%      +0.3        5.71 ± 11%      +0.4        5.83 ± 11%  perf-profile.children.cycles-pp.__x64_sys_umount
> >       2.65 ± 28%      +0.1        2.71 ± 13%      +0.2        2.82 ± 15%      +0.3        2.94 ± 11%  perf-profile.children.cycles-pp.stress_rndstr
> >       0.87 ± 28%      +0.1        0.93 ± 15%      +0.1        0.96 ± 17%      +0.1        1.00 ± 13%  perf-profile.children.cycles-pp.process_srcu
> >       0.22 ± 33%      +0.1        0.28 ± 12%      +0.1        0.31 ± 12%      +0.1        0.29 ± 10%  perf-profile.children.cycles-pp.___slab_alloc
> >       0.76 ± 24%      +0.1        0.83 ± 10%      -0.0        0.74 ± 14%      -0.0        0.76 ±  9%  perf-profile.children.cycles-pp.vsnprintf
> >       0.64 ± 28%      +0.1        0.70 ±  8%      +0.0        0.68 ± 11%      +0.1        0.74 ± 15%  perf-profile.children.cycles-pp.vfs_symlink
> >       2.59 ± 19%      +0.1        2.65 ±  8%      +0.2        2.74 ±  7%      +0.1        2.66 ±  7%  perf-profile.children.cycles-pp.user_path_at_empty
> >       0.23 ± 21%      +0.1        0.29 ±  8%      +0.0        0.27 ± 14%      +0.0        0.28 ± 14%  perf-profile.children.cycles-pp.__x64_sys_close
> >       0.74 ± 25%      +0.1        0.81 ± 18%      +0.1        0.81 ± 15%      +0.1        0.83 ± 12%  perf-profile.children.cycles-pp.rmdir
> >       0.74 ± 27%      +0.1        0.80 ± 15%      +0.1        0.80 ±  8%      +0.1        0.81 ± 13%  perf-profile.children.cycles-pp.synchronize_rcu_expedited
> >       0.55 ± 18%      +0.1        0.61 ± 10%      +0.1        0.63 ± 15%      +0.0        0.59 ± 14%  perf-profile.children.cycles-pp.activate_task
> >       2.78 ± 17%      +0.1        2.85 ±  6%      +0.1        2.90 ±  7%      +0.1        2.87 ±  5%  perf-profile.children.cycles-pp.open64
> >       0.32 ± 20%      +0.1        0.39 ±  6%      +0.1        0.39 ± 19%      +0.1        0.40 ±  9%  perf-profile.children.cycles-pp.__d_lookup
> >       4.47 ± 16%      +0.1        4.54 ±  4%      +0.1        4.57 ±  8%      -0.0        4.45 ±  2%  perf-profile.children.cycles-pp.do_sys_openat2
> >       4.50 ± 16%      +0.1        4.58 ±  4%      +0.1        4.61 ±  8%      -0.0        4.49 ±  2%  perf-profile.children.cycles-pp.__x64_sys_openat
> >       1.60 ± 22%      +0.1        1.68 ± 14%      +0.2        1.78 ±  7%      +0.2        1.79 ±  8%  perf-profile.children.cycles-pp.strncpy_from_user
> >       0.37 ± 31%      +0.1        0.45 ± 13%      +0.0        0.41 ± 14%      +0.0        0.41 ±  7%  perf-profile.children.cycles-pp.__legitimize_path
> >       1.34 ± 31%      +0.1        1.42 ± 11%      +0.1        1.47 ± 13%      +0.2        1.50 ± 12%  perf-profile.children.cycles-pp.do_unlinkat
> >       0.00            +0.1        0.08 ± 16%      +0.1        0.08 ± 52%      +0.1        0.07 ± 20%  perf-profile.children.cycles-pp.pcpu_next_md_free_region
> >       0.11 ± 26%      +0.1        0.19 ± 42%      +0.1        0.17 ± 31%      +0.1        0.20 ± 31%  perf-profile.children.cycles-pp.srcu_invoke_callbacks
> >       0.09 ± 33%      +0.1        0.17 ± 43%      +0.1        0.16 ± 84%      +0.1        0.16 ± 59%  perf-profile.children.cycles-pp.srcu_gp_end
> >       0.43 ± 30%      +0.1        0.52 ± 13%      +0.0        0.46 ± 15%      +0.1        0.49 ± 11%  perf-profile.children.cycles-pp.try_to_unlazy
> >       2.65 ± 24%      +0.1        2.74 ±  9%      -0.1        2.56 ± 13%      -0.1        2.55 ±  7%  perf-profile.children.cycles-pp.read
> >       0.75 ± 21%      +0.1        0.84 ±  3%      +0.1        0.83 ± 12%      -0.0        0.75 ± 10%  perf-profile.children.cycles-pp.do_readlinkat
> >       1.47 ± 32%      +0.1        1.56 ± 12%      +0.1        1.62 ± 12%      +0.2        1.65 ± 12%  perf-profile.children.cycles-pp.__x64_sys_unlink
> >       0.15 ± 24%      +0.1        0.24 ± 13%      +0.1        0.24 ± 19%      +0.1        0.24 ±  5%  perf-profile.children.cycles-pp.rcu_cblist_dequeue
> >       1.30 ± 31%      +0.1        1.39 ±  9%      +0.0        1.32 ± 12%      +0.0        1.32 ± 12%  perf-profile.children.cycles-pp.malloc
> >       1.10 ± 29%      +0.1        1.19 ± 10%      +0.1        1.16 ±  9%      +0.1        1.19 ± 14%  perf-profile.children.cycles-pp.do_symlinkat
> >       0.01 ±200%      +0.1        0.10 ± 13%      +0.1        0.12 ± 31%      +0.1        0.09 ± 18%  perf-profile.children.cycles-pp.pcpu_chunk_refresh_hint
> >       0.47 ± 27%      +0.1        0.56 ± 18%      +0.1        0.56 ± 16%      +0.1        0.60 ± 28%  perf-profile.children.cycles-pp.intel_idle_irq
> >       0.00            +0.1        0.09 ± 28%      +0.1        0.11 ± 14%      +0.1        0.10 ± 14%  perf-profile.children.cycles-pp.rmqueue_bulk
> >       3.15 ± 24%      +0.1        3.24 ±  8%      +0.0        3.15 ± 13%      -0.1        3.08 ±  9%  perf-profile.children.cycles-pp.sd_device_new_from_syspath
> >       2.14 ± 19%      +0.1        2.23 ± 14%      +0.2        2.35 ±  6%      +0.2        2.33 ±  8%  perf-profile.children.cycles-pp.getname_flags
> >       0.27 ± 23%      +0.1        0.37 ± 40%      +0.0        0.28 ± 27%      +0.0        0.30 ± 26%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
> >       0.69 ± 21%      +0.1        0.79 ±  3%      +0.1        0.78 ± 12%      +0.0        0.71 ± 11%  perf-profile.children.cycles-pp.__x64_sys_readlinkat
> >       0.68 ± 18%      +0.1        0.78 ± 11%      +0.1        0.75 ± 16%      +0.1        0.77 ± 13%  perf-profile.children.cycles-pp.ttwu_do_activate
> >       0.49 ± 23%      +0.1        0.59 ± 14%      +0.1        0.61 ± 23%      +0.1        0.59 ± 14%  perf-profile.children.cycles-pp.schedule_timeout
> >       2.45 ± 18%      +0.1        2.55 ±  6%      +0.1        2.54 ± 12%      +0.1        2.56 ±  7%  perf-profile.children.cycles-pp.__do_softirq
> >       1.08 ± 21%      +0.1        1.19 ± 12%      +0.1        1.16 ± 12%      +0.2        1.26 ± 10%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
> >       0.52 ± 26%      +0.1        0.63 ± 13%      +0.1        0.64 ± 22%      +0.2        0.68 ± 18%  perf-profile.children.cycles-pp.__queue_work
> >       1.24 ± 29%      +0.1        1.36 ± 11%      +0.1        1.30 ± 10%      +0.1        1.35 ± 14%  perf-profile.children.cycles-pp.__x64_sys_symlink
> >       0.44 ± 27%      +0.1        0.56 ± 11%      +0.1        0.57 ± 23%      +0.1        0.57 ± 23%  perf-profile.children.cycles-pp.queue_work_on
> >       0.71 ± 21%      +0.1        0.83 ±  4%      +0.1        0.82 ± 13%      +0.0        0.74 ± 11%  perf-profile.children.cycles-pp.readlinkat
> >       1.47 ± 17%      +0.1        1.59 ±  5%      +0.1        1.56 ± 10%      +0.0        1.49 ±  7%  perf-profile.children.cycles-pp.__close
> >       1.02 ± 18%      +0.1        1.14 ± 14%      +0.1        1.09 ± 18%      +0.1        1.11 ± 13%  perf-profile.children.cycles-pp.try_to_wake_up
> >       0.54 ± 25%      +0.1        0.66 ±  9%      +0.1        0.69 ± 14%      +0.2        0.71 ±  8%  perf-profile.children.cycles-pp.pcpu_alloc_area
> >       0.00            +0.1        0.12 ±118%      +0.0        0.05 ±182%      +0.1        0.10 ±122%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
> >       1.31 ± 28%      +0.1        1.44 ± 11%      +0.1        1.38 ±  9%      +0.1        1.44 ± 12%  perf-profile.children.cycles-pp.symlink
> >       2.08 ± 22%      +0.1        2.20 ±  5%      +0.1        2.22 ± 12%      +0.2        2.27 ±  8%  perf-profile.children.cycles-pp.rcu_do_batch
> >       0.66 ± 24%      +0.1        0.79 ± 15%      +0.1        0.78 ± 21%      +0.1        0.76 ± 11%  perf-profile.children.cycles-pp.__wait_for_common
> >       0.23 ± 18%      +0.1        0.37 ± 47%      +0.1        0.30 ± 82%      +0.1        0.28 ± 62%  perf-profile.children.cycles-pp.poll_idle
> >       0.45 ± 15%      +0.1        0.60 ± 13%      +0.1        0.58 ± 10%      +0.2        0.60 ±  4%  perf-profile.children.cycles-pp.kmalloc_trace
> >       2.13 ± 22%      +0.1        2.28 ±  5%      +0.1        2.27 ± 12%      +0.2        2.31 ±  8%  perf-profile.children.cycles-pp.rcu_core
> >       0.77 ± 32%      +0.1        0.92 ± 19%      +0.2        1.00 ± 22%      +0.3        1.10 ± 25%  perf-profile.children.cycles-pp.x86_64_start_kernel
> >       0.77 ± 32%      +0.1        0.92 ± 19%      +0.2        1.00 ± 22%      +0.3        1.10 ± 25%  perf-profile.children.cycles-pp.x86_64_start_reservations
> >       0.77 ± 32%      +0.1        0.92 ± 19%      +0.2        1.00 ± 22%      +0.3        1.10 ± 25%  perf-profile.children.cycles-pp.start_kernel
> >       0.77 ± 32%      +0.1        0.92 ± 19%      +0.2        1.00 ± 22%      +0.3        1.10 ± 25%  perf-profile.children.cycles-pp.arch_call_rest_init
> >       0.77 ± 32%      +0.1        0.92 ± 19%      +0.2        1.00 ± 22%      +0.3        1.10 ± 25%  perf-profile.children.cycles-pp.rest_init
> >       0.00            +0.2        0.17 ± 16%      +0.2        0.20 ± 22%      +0.2        0.19 ± 14%  perf-profile.children.cycles-pp.rcu_segcblist_init
> >       0.86 ± 22%      +0.2        1.03 ± 11%      +0.2        1.02 ±  6%      +0.2        1.07 ±  4%  perf-profile.children.cycles-pp.__kmem_cache_alloc_node
> >       0.01 ±200%      +0.2        0.19 ± 22%      +0.2        0.21 ± 14%      +0.2        0.20 ±  7%  perf-profile.children.cycles-pp.rmqueue
> >       0.03 ± 82%      +0.2        0.23 ± 25%      +0.2        0.24 ± 17%      +0.2        0.23 ± 12%  perf-profile.children.cycles-pp.get_page_from_freelist
> >       0.00            +0.2        0.22 ± 24%      +0.2        0.23 ± 20%      +0.2        0.23 ± 11%  perf-profile.children.cycles-pp.pcpu_alloc_pages
> >       0.05 ± 55%      +0.2        0.28 ± 22%      +0.2        0.29 ± 22%      +0.2        0.29 ± 12%  perf-profile.children.cycles-pp.__alloc_pages
> >       0.00            +0.3        0.27 ± 23%      +0.3        0.30 ± 22%      +0.3        0.27 ± 11%  perf-profile.children.cycles-pp.pcpu_populate_chunk
> >       0.00            +0.3        0.32 ± 19%      +0.4        0.36 ± 21%      +0.3        0.33 ± 14%  perf-profile.children.cycles-pp.pcpu_balance_populated
> >       0.00            +0.3        0.32 ± 19%      +0.4        0.36 ± 21%      +0.3        0.33 ± 15%  perf-profile.children.cycles-pp.pcpu_balance_workfn
> >       3.48 ± 25%      +0.6        4.08 ± 14%      +0.7        4.19 ± 11%      +0.8        4.23 ± 10%  perf-profile.children.cycles-pp.process_one_work
> >       4.38 ± 24%      +0.7        5.10 ± 13%      +0.8        5.19 ± 10%      +0.9        5.26 ± 10%  perf-profile.children.cycles-pp.worker_thread
> >       0.47 ± 21%      +0.7        1.19 ± 67%      +0.4        0.84 ± 66%      +0.7        1.15 ± 78%  perf-profile.children.cycles-pp.smpboot_thread_fn
> >       0.39 ± 24%      +0.7        1.13 ± 69%      +0.4        0.76 ± 68%      +0.7        1.09 ± 82%  perf-profile.children.cycles-pp.run_ksoftirqd
> >       1.28 ± 23%      +0.9        2.18 ± 14%      +0.9        2.16 ±  9%      +0.9        2.20 ±  9%  perf-profile.children.cycles-pp.memset_orig
> >       4.92 ± 21%      +1.4        6.32 ± 11%      +1.2        6.09 ±  9%      +1.5        6.46 ± 16%  perf-profile.children.cycles-pp.ret_from_fork
> >       4.92 ± 21%      +1.4        6.32 ± 11%      +1.2        6.09 ±  9%      +1.5        6.46 ± 16%  perf-profile.children.cycles-pp.kthread
> >       0.09 ± 35%      +1.5        1.55 ± 44%      +2.1        2.16 ± 21%      +2.3        2.43 ±  5%  perf-profile.children.cycles-pp.pcpu_find_block_fit
> >       2.83 ± 27%      +3.9        6.73 ± 20%      +5.3        8.09 ± 15%      +5.8        8.66 ±  6%  perf-profile.children.cycles-pp.pcpu_alloc
> >       2.84 ± 30%      +4.6        7.44 ± 18%      +6.1        8.92 ± 16%      +6.6        9.42 ±  6%  perf-profile.children.cycles-pp.vfs_get_super
> >       2.85 ± 30%      +4.6        7.46 ± 18%      +6.1        8.94 ± 16%      +6.6        9.44 ±  6%  perf-profile.children.cycles-pp.vfs_get_tree
> >       7.93 ± 28%      +4.7       12.61 ± 14%      +6.3       14.26 ± 13%      +7.0       14.98 ±  8%  perf-profile.children.cycles-pp.__x64_sys_mount
> >       1.56 ± 30%      +4.7        6.23 ± 21%      +6.0        7.55 ± 16%      +6.5        8.05 ±  5%  perf-profile.children.cycles-pp.alloc_super
> >       8.03 ± 28%      +4.7       12.71 ± 14%      +6.3       14.36 ± 13%      +7.1       15.09 ±  8%  perf-profile.children.cycles-pp.mount
> >       1.68 ± 30%      +4.7        6.37 ± 21%      +6.0        7.72 ± 16%      +6.5        8.20 ±  5%  perf-profile.children.cycles-pp.sget_fc
> >       7.20 ± 28%      +4.7       11.90 ± 15%      +6.3       13.53 ± 13%      +7.0       14.20 ±  9%  perf-profile.children.cycles-pp.do_new_mount
> >      35.29 ± 18%      +4.7       40.03 ±  7%      +7.1       42.35 ±  8%      +7.6       42.87 ±  5%  perf-profile.children.cycles-pp.do_syscall_64
> >      35.50 ± 18%      +4.7       40.25 ±  7%      +7.1       42.56 ±  8%      +7.6       43.07 ±  6%  perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
> >       0.00            +4.9        4.91 ± 25%      +6.2        6.18 ± 16%      +6.6        6.61 ±  5%  perf-profile.children.cycles-pp.init_srcu_struct_fields
> >      37.09 ± 26%      -6.1       30.96 ± 10%      -8.1       28.98 ± 12%      -8.5       28.64 ±  8%  perf-profile.self.cycles-pp.intel_idle
> >       0.80 ± 15%      -0.1        0.70 ± 17%      +0.0        0.84 ± 24%      -0.1        0.73 ± 21%  perf-profile.self.cycles-pp.update_sg_lb_stats
> >       0.40 ± 19%      -0.1        0.32 ±  8%      -0.0        0.37 ± 19%      -0.1        0.33 ± 17%  perf-profile.self.cycles-pp.cpuidle_enter_state
> >       0.48 ± 24%      -0.1        0.41 ± 16%      -0.1        0.40 ± 16%      -0.1        0.38 ± 12%  perf-profile.self.cycles-pp.path_init
> >       0.57 ± 24%      -0.1        0.51 ± 12%      -0.0        0.57 ± 15%      +0.0        0.59 ±  8%  perf-profile.self.cycles-pp.mnt_get_writers
> >       0.58 ± 24%      -0.1        0.53 ± 19%      +0.0        0.58 ± 18%      +0.0        0.60 ± 16%  perf-profile.self.cycles-pp.try_check_zero
> >       0.08 ± 27%      -0.0        0.03 ±100%      -0.0        0.07 ± 23%      -0.0        0.04 ± 87%  perf-profile.self.cycles-pp.llist_reverse_order
> >       1.16 ± 23%      -0.0        1.12 ± 14%      -0.0        1.16 ± 15%      +0.1        1.29 ± 12%  perf-profile.self.cycles-pp.mnt_get_count
> >       0.17 ± 11%      -0.0        0.12 ± 15%      -0.0        0.14 ± 28%      -0.0        0.14 ± 35%  perf-profile.self.cycles-pp.read_tsc
> >       0.44 ±  5%      -0.0        0.40 ± 10%      +0.0        0.45 ± 15%      -0.0        0.43 ±  9%  perf-profile.self.cycles-pp.perf_adjust_freq_unthr_context
> >       0.28 ±  8%      -0.0        0.24 ± 19%      -0.0        0.27 ± 19%      -0.0        0.25 ± 12%  perf-profile.self.cycles-pp.__intel_pmu_enable_all
> >       0.07 ± 16%      -0.0        0.03 ±100%      -0.0        0.05 ± 74%      -0.0        0.04 ± 88%  perf-profile.self.cycles-pp.__pthread_mutex_unlock_usercnt
> >       0.05 ± 57%      -0.0        0.01 ±223%      -0.0        0.05 ± 48%      +0.0        0.06 ± 14%  perf-profile.self.cycles-pp.strspn@plt
> >       0.13 ± 17%      -0.0        0.09 ± 23%      -0.0        0.11 ± 22%      -0.0        0.09 ± 15%  perf-profile.self.cycles-pp.ct_kernel_exit_state
> >       0.21 ± 13%      -0.0        0.17 ± 22%      +0.0        0.22 ± 20%      -0.0        0.19 ± 21%  perf-profile.self.cycles-pp.lapic_next_deadline
> >       0.05 ± 56%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp._ext4_show_options
> >       0.06 ± 10%      -0.0        0.02 ± 99%      -0.0        0.03 ±101%      -0.0        0.03 ± 81%  perf-profile.self.cycles-pp.load_balance
> >       0.04 ± 88%      -0.0        0.01 ±223%      -0.0        0.03 ±108%      -0.0        0.02 ±123%  perf-profile.self.cycles-pp.strjoin_real
> >       0.03 ±200%      -0.0        0.00            +0.0        0.04 ±147%      +0.0        0.07 ± 81%  perf-profile.self.cycles-pp.timekeeping_max_deferment
> >       0.04 ± 82%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.calc_global_load_tick
> >       0.27 ± 35%      -0.0        0.24 ± 14%      -0.1        0.21 ± 17%      -0.1        0.20 ± 15%  perf-profile.self.cycles-pp.unit_name_is_valid
> >       0.08 ± 32%      -0.0        0.06 ± 47%      -0.0        0.06 ± 48%      -0.0        0.06 ± 18%  perf-profile.self.cycles-pp.slab_pre_alloc_hook
> >       0.17 ± 45%      -0.0        0.14 ± 21%      -0.0        0.14 ± 15%      -0.0        0.16 ±  8%  perf-profile.self.cycles-pp.apparmor_capable
> >       0.09 ± 23%      -0.0        0.06 ± 11%      -0.0        0.07 ± 53%      -0.0        0.04 ± 85%  perf-profile.self.cycles-pp.__pthread_mutex_lock
> >       0.17 ± 38%      -0.0        0.14 ± 11%      -0.0        0.16 ±  9%      -0.0        0.16 ± 20%  perf-profile.self.cycles-pp.up_read
> >       0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.sched_clock_cpu
> >       0.09 ± 17%      -0.0        0.07 ± 47%      -0.0        0.08 ± 52%      -0.0        0.08 ± 17%  perf-profile.self.cycles-pp.__fget_light
> >       0.04 ± 50%      -0.0        0.02 ±141%      -0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.seq_printf
> >       0.02 ±123%      -0.0        0.00            -0.0        0.00            -0.0        0.01 ±200%  perf-profile.self.cycles-pp.asm_sysvec_apic_timer_interrupt
> >       0.02 ±123%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±122%  perf-profile.self.cycles-pp.___d_drop
> >       0.05 ± 90%      -0.0        0.03 ±102%      -0.0        0.03 ±106%      -0.0        0.02 ±123%  perf-profile.self.cycles-pp.mnt_fstype_is_pseudofs
> >       0.06 ± 53%      -0.0        0.04 ±109%      -0.0        0.03 ±106%      -0.0        0.03 ±122%  perf-profile.self.cycles-pp.sync_regs
> >       0.05 ± 55%      -0.0        0.03 ±105%      +0.0        0.07 ± 28%      +0.0        0.06 ± 12%  perf-profile.self.cycles-pp.getdelim
> >       0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.vfs_read
> >       0.02 ±122%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__d_rehash
> >       0.02 ±122%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.pcpu_free_area
> >       0.02 ±122%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.rcu_note_context_switch
> >       0.03 ±130%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.shmem_show_options
> >       0.04 ± 90%      -0.0        0.02 ±142%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.truncate_inode_pages_range
> >       0.04 ± 83%      -0.0        0.02 ±142%      -0.0        0.02 ± 99%      +0.0        0.04 ± 50%  perf-profile.self.cycles-pp.ep_poll_callback
> >       0.03 ±122%      -0.0        0.01 ±223%      +0.0        0.03 ±101%      -0.0        0.00        perf-profile.self.cycles-pp.trigger_load_balance
> >       0.07 ± 57%      -0.0        0.05 ± 74%      +0.0        0.08 ± 18%      +0.0        0.08 ± 19%  perf-profile.self.cycles-pp.__srcu_read_unlock
> >       0.11 ± 15%      -0.0        0.09 ± 34%      +0.0        0.12 ± 36%      -0.0        0.09 ± 19%  perf-profile.self.cycles-pp.update_sd_lb_stats
> >       0.05 ± 86%      -0.0        0.03 ±102%      +0.0        0.05 ±  8%      -0.0        0.03 ± 82%  perf-profile.self.cycles-pp.do_idle
> >       0.09 ± 35%      -0.0        0.08 ± 25%      -0.0        0.08 ± 14%      -0.0        0.07 ± 18%  perf-profile.self.cycles-pp.exit_to_user_mode_prepare
> >       0.17 ± 26%      -0.0        0.15 ± 13%      -0.0        0.16 ± 15%      -0.0        0.15 ±  7%  perf-profile.self.cycles-pp.rcu_all_qs
> >       0.15 ± 48%      -0.0        0.13 ± 30%      +0.0        0.15 ± 14%      -0.0        0.15 ± 15%  perf-profile.self.cycles-pp.__lookup_mnt
> >       0.13 ± 15%      -0.0        0.11 ± 26%      +0.0        0.14 ± 18%      +0.0        0.14 ± 16%  perf-profile.self.cycles-pp.check_heap_object
> >       0.24 ± 15%      -0.0        0.22 ± 11%      -0.0        0.22 ± 20%      -0.0        0.21 ± 11%  perf-profile.self.cycles-pp.native_irq_return_iret
> >       0.02 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.__flush_work
> >       0.21 ± 21%      -0.0        0.20 ± 14%      +0.0        0.24 ± 13%      +0.0        0.23 ± 12%  perf-profile.self.cycles-pp.generic_permission
> >       0.24 ± 34%      -0.0        0.22 ± 10%      -0.0        0.21 ± 21%      -0.0        0.21 ± 17%  perf-profile.self.cycles-pp.vsnprintf
> >       0.09 ± 21%      -0.0        0.07 ±  9%      -0.0        0.07 ± 55%      -0.0        0.07 ± 15%  perf-profile.self.cycles-pp.update_irq_load_avg
> >       0.21 ± 17%      -0.0        0.20 ±  8%      -0.0        0.19 ± 19%      -0.0        0.20 ± 15%  perf-profile.self.cycles-pp.menu_select
> >       0.04 ± 53%      -0.0        0.03 ±101%      -0.0        0.04 ± 75%      -0.0        0.02 ±122%  perf-profile.self.cycles-pp.terminate_walk
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.02 ±125%  perf-profile.self.cycles-pp.tick_nohz_next_event
> >       0.08 ± 25%      -0.0        0.07 ± 14%      -0.0        0.05 ± 73%      -0.0        0.05 ± 85%  perf-profile.self.cycles-pp.mangle_path
> >       0.02 ±123%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.check_stack_object
> >       0.02 ±123%      -0.0        0.01 ±223%      -0.0        0.02 ±142%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp._dbus_first_type_in_signature
> >       0.03 ±122%      -0.0        0.02 ±141%      -0.0        0.03 ±101%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.open64
> >       0.04 ± 85%      -0.0        0.03 ±100%      -0.0        0.02 ±142%      +0.0        0.04 ± 85%  perf-profile.self.cycles-pp.__wake_up_common_lock
> >       0.14 ± 20%      -0.0        0.13 ± 24%      -0.0        0.14 ± 17%      -0.0        0.12 ± 21%  perf-profile.self.cycles-pp.__get_obj_cgroup_from_memcg
> >       0.06 ± 54%      -0.0        0.04 ± 77%      +0.0        0.06 ± 48%      +0.0        0.06 ± 53%  perf-profile.self.cycles-pp.xas_start
> >       0.03 ±123%      -0.0        0.01 ±223%      +0.0        0.04 ± 72%      -0.0        0.02 ±122%  perf-profile.self.cycles-pp.perf_pmu_nop_void
> >       0.07 ± 32%      -0.0        0.06 ± 52%      +0.0        0.08 ± 16%      +0.0        0.09 ±  9%  perf-profile.self.cycles-pp.__wrgsbase_inactive
> >       0.16 ± 18%      -0.0        0.15 ± 21%      -0.0        0.16 ± 18%      -0.0        0.15 ±  7%  perf-profile.self.cycles-pp.update_load_avg
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__get_fs_type
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.map_id_range_down
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.xa_load
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.reweight_entity
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.change_mnt_propagation
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.fput
> >       0.01 ±200%      -0.0        0.00            +0.0        0.02 ±146%      -0.0        0.00        perf-profile.self.cycles-pp.update_process_times
> >       0.01 ±200%      -0.0        0.00            +0.0        0.02 ± 99%      -0.0        0.00        perf-profile.self.cycles-pp.hashmap_get2
> >       0.04 ± 85%      -0.0        0.03 ±100%      -0.0        0.02 ± 99%      -0.0        0.03 ± 84%  perf-profile.self.cycles-pp.update_cfs_group
> >       0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.complete_walk
> >       0.02 ±122%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp._dbus_marshal_read_uint32
> >       0.03 ±130%      -0.0        0.02 ±141%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.strnlen
> >       0.04 ± 81%      -0.0        0.02 ± 99%      -0.0        0.00            -0.0        0.03 ± 82%  perf-profile.self.cycles-pp.seq_puts
> >       0.16 ± 33%      -0.0        0.15 ± 11%      -0.0        0.16 ± 19%      -0.0        0.13 ± 27%  perf-profile.self.cycles-pp.smp_call_function_single
> >       0.07 ± 20%      -0.0        0.06 ± 50%      +0.0        0.08 ± 20%      +0.0        0.08 ± 20%  perf-profile.self.cycles-pp.common_perm_cond
> >       0.21 ± 15%      -0.0        0.20 ± 12%      -0.0        0.18 ± 14%      -0.0        0.19 ± 12%  perf-profile.self.cycles-pp.rcu_report_exp_cpu_mult
> >       0.20 ± 15%      -0.0        0.19 ± 12%      +0.0        0.21 ± 10%      -0.0        0.20 ±  6%  perf-profile.self.cycles-pp.__switch_to
> >       0.05 ± 56%      -0.0        0.04 ± 72%      -0.0        0.03 ±103%      +0.0        0.07 ± 11%  perf-profile.self.cycles-pp.check_preempt_wakeup
> >       0.04 ± 50%      -0.0        0.03 ±101%      -0.0        0.03 ±101%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.alloc_empty_file
> >       0.04 ± 50%      -0.0        0.03 ±101%      -0.0        0.03 ±101%      +0.0        0.06 ± 51%  perf-profile.self.cycles-pp.memcg_destroy_list_lru
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.seq_read_iter
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.asm_sysvec_call_function_single
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp._dbus_type_reader_recurse
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.update_rt_rq_load_avg
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.__list_lru_init
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.iput
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.mntput
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.xas_expand
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.delete_trailing_chars
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.sd_bus_message_open_container
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.siphash24_init@plt
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.strsep
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.copy_tree
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.radix_tree_node_rcu_free
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.xas_create
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.select_task_rq
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.filemap_get_entry
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.page_counter_uncharge
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.srcu_advance_state
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__d_alloc
> >       0.01 ±200%      -0.0        0.00            -0.0        0.00            +0.0        0.02 ±122%  perf-profile.self.cycles-pp.put_fs_context
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.rb_insert_color
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.do_umount
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.vfs_unlink
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.rb_next
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.greedy_realloc
> >       0.01 ±200%      -0.0        0.00            -0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.inode_init_once
> >       0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.lookup_open
> >       0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.kmalloc_trace
> >       0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.deactivate_super
> >       0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.try_charge_memcg
> >       0.01 ±200%      -0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.should_failslab
> >       0.01 ±200%      -0.0        0.00            +0.0        0.02 ±142%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.xas_load
> >       0.01 ±200%      -0.0        0.00            +0.0        0.02 ± 99%      -0.0        0.00        perf-profile.self.cycles-pp.hrtimer_interrupt
> >       0.01 ±200%      -0.0        0.00            +0.0        0.03 ±103%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.newidle_balance
> >       0.38 ± 22%      -0.0        0.37 ±  8%      -0.0        0.38 ± 13%      +0.0        0.41 ± 10%  perf-profile.self.cycles-pp.mod_objcg_state
> >       0.11 ± 50%      -0.0        0.10 ± 21%      +0.0        0.12 ± 16%      +0.0        0.13 ± 31%  perf-profile.self.cycles-pp.xas_store
> >       0.06 ± 54%      -0.0        0.05 ± 46%      -0.0        0.05 ± 51%      -0.0        0.05 ± 54%  perf-profile.self.cycles-pp.memcg_list_lru_alloc
> >       0.05 ± 51%      -0.0        0.04 ± 72%      -0.0        0.04 ± 72%      +0.0        0.06 ± 53%  perf-profile.self.cycles-pp.worker_thread
> >       0.14 ± 26%      -0.0        0.13 ± 14%      +0.0        0.15 ± 14%      +0.0        0.14 ± 25%  perf-profile.self.cycles-pp.___perf_sw_event
> >       0.03 ±123%      -0.0        0.02 ±141%      -0.0        0.02 ±141%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.__wake_up_common
> >       0.04 ± 83%      -0.0        0.03 ±100%      +0.0        0.04 ± 71%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.d_walk
> >       0.08 ± 36%      -0.0        0.08 ± 21%      +0.0        0.09 ± 23%      +0.0        0.09 ± 19%  perf-profile.self.cycles-pp.__fput
> >       0.08 ± 17%      -0.0        0.08 ± 10%      +0.0        0.09 ± 30%      +0.0        0.08 ± 16%  perf-profile.self.cycles-pp.pcpu_block_update
> >       0.10 ± 35%      -0.0        0.10 ± 28%      -0.0        0.09 ± 26%      -0.1        0.05 ± 55%  perf-profile.self.cycles-pp.arch_scale_freq_tick
> >       0.10 ± 22%      -0.0        0.09 ± 25%      -0.0        0.08 ± 49%      -0.0        0.10 ± 12%  perf-profile.self.cycles-pp.rcu_pending
> >       0.09 ± 27%      -0.0        0.08 ± 20%      -0.0        0.09 ± 18%      -0.0        0.08 ± 14%  perf-profile.self.cycles-pp._copy_to_user
> >       0.06 ± 51%      -0.0        0.05 ± 49%      -0.0        0.02 ±144%      -0.0        0.04 ± 83%  perf-profile.self.cycles-pp.pcpu_block_update_hint_free
> >       0.05 ± 52%      -0.0        0.04 ± 72%      -0.0        0.03 ±100%      -0.0        0.05 ± 51%  perf-profile.self.cycles-pp.__mnt_want_write
> >       0.03 ±122%      -0.0        0.02 ±142%      -0.0        0.03 ±100%      -0.0        0.02 ±123%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
> >       0.02 ±122%      -0.0        0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.__radix_tree_lookup
> >       0.07 ± 22%      -0.0        0.06 ± 19%      -0.0        0.06 ± 48%      -0.0        0.06 ± 54%  perf-profile.self.cycles-pp.generic_fillattr
> >       0.12 ± 29%      -0.0        0.11 ± 14%      +0.0        0.12 ± 18%      +0.0        0.13 ± 23%  perf-profile.self.cycles-pp._hashmap_first_key_and_value
> >       0.03 ±130%      -0.0        0.02 ±144%      -0.0        0.02 ±141%      -0.0        0.02 ±125%  perf-profile.self.cycles-pp.strcspn@plt
> >       0.17 ± 24%      -0.0        0.16 ± 11%      +0.0        0.17 ± 15%      +0.0        0.18 ± 12%  perf-profile.self.cycles-pp.__update_load_avg_se
> >       0.04 ± 83%      -0.0        0.03 ±100%      -0.0        0.00            -0.0        0.03 ± 82%  perf-profile.self.cycles-pp.xas_clear_mark
> >       0.02 ±125%      -0.0        0.02 ±141%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp._hashmap_get
> >       0.07 ± 52%      -0.0        0.07 ± 48%      +0.0        0.09 ± 23%      +0.0        0.08 ± 20%  perf-profile.self.cycles-pp.xas_descend
> >       0.03 ± 82%      -0.0        0.03 ±100%      -0.0        0.00            -0.0        0.02 ±123%  perf-profile.self.cycles-pp.strncmp
> >       0.12 ± 22%      -0.0        0.12 ± 26%      +0.0        0.13 ± 17%      +0.0        0.13 ± 21%  perf-profile.self.cycles-pp.idle_cpu
> >       0.27 ± 17%      -0.0        0.26 ± 12%      +0.0        0.28 ± 16%      +0.0        0.28 ± 14%  perf-profile.self.cycles-pp.lockref_put_return
> >       0.11 ± 26%      -0.0        0.10 ± 33%      -0.0        0.11 ± 20%      +0.0        0.11 ± 22%  perf-profile.self.cycles-pp.realloc
> >       0.03 ±123%      -0.0        0.02 ±144%      -0.0        0.02 ±141%      +0.0        0.03 ± 81%  perf-profile.self.cycles-pp.fsnotify_destroy_marks
> >       0.15 ± 10%      -0.0        0.14 ± 18%      +0.0        0.15 ± 19%      -0.0        0.13 ±  8%  perf-profile.self.cycles-pp.filename_lookup
> >       0.24 ± 17%      -0.0        0.24 ±  7%      -0.0        0.24 ±  7%      -0.0        0.24 ± 11%  perf-profile.self.cycles-pp.rep_movs_alternative
> >       0.11 ± 22%      -0.0        0.11 ± 16%      +0.0        0.12 ± 10%      +0.0        0.11 ± 10%  perf-profile.self.cycles-pp.set_root
> >       0.03 ± 82%      -0.0        0.03 ±100%      -0.0        0.02 ±142%      +0.0        0.04 ± 83%  perf-profile.self.cycles-pp.copy_from_kernel_nofault
> >       0.02 ±123%      -0.0        0.02 ±141%      +0.0        0.07 ± 50%      +0.0        0.03 ±127%  perf-profile.self.cycles-pp.os_xsave
> >       0.08 ± 34%      -0.0        0.08 ± 22%      -0.0        0.07 ± 54%      -0.0        0.07 ± 20%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
> >       0.25 ± 25%      -0.0        0.24 ± 11%      +0.0        0.25 ± 12%      -0.0        0.23 ± 12%  perf-profile.self.cycles-pp.inode_permission
> >       0.08 ± 28%      -0.0        0.07 ± 18%      -0.0        0.08 ± 12%      +0.0        0.09 ± 14%  perf-profile.self.cycles-pp.__memset
> >       0.06 ± 21%      -0.0        0.06 ± 51%      -0.0        0.05 ± 71%      -0.0        0.05 ± 54%  perf-profile.self.cycles-pp.try_to_wake_up
> >       0.03 ± 82%      -0.0        0.03 ±101%      -0.0        0.02 ± 99%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.build_open_flags
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.pcpu_block_refresh_hint
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.unit_name_escape
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__lxstat64
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.irqtime_account_irq
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.xas_find
> >       0.03 ±128%      -0.0        0.03 ±102%      -0.0        0.03 ±101%      +0.0        0.06 ± 12%  perf-profile.self.cycles-pp.cpuidle_idle_call
> >       0.50 ± 24%      -0.0        0.50 ± 11%      -0.0        0.49 ± 16%      -0.1        0.45 ±  8%  perf-profile.self.cycles-pp.rdrand
> >       0.11 ± 21%      -0.0        0.11 ± 24%      +0.0        0.13 ± 11%      +0.0        0.13 ± 13%  perf-profile.self.cycles-pp.mutex_lock
> >       0.03 ± 81%      -0.0        0.03 ±100%      -0.0        0.02 ± 99%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp._IO_feof
> >       0.09 ± 15%      -0.0        0.09 ± 41%      -0.0        0.08 ± 50%      -0.0        0.07 ± 10%  perf-profile.self.cycles-pp._find_next_and_bit
> >       0.19 ± 25%      -0.0        0.19 ± 13%      -0.0        0.18 ± 13%      -0.0        0.18 ± 13%  perf-profile.self.cycles-pp.number
> >       0.08 ± 22%      -0.0        0.08 ± 31%      +0.0        0.09 ± 16%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
> >       0.06 ± 82%      -0.0        0.05 ± 80%      -0.0        0.06 ± 81%      -0.0        0.05 ± 91%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
> >       0.27 ±  5%      -0.0        0.26 ±  9%      +0.0        0.28 ± 13%      +0.0        0.27 ± 15%  perf-profile.self.cycles-pp.__cond_resched
> >       0.09 ± 17%      -0.0        0.09 ± 11%      -0.0        0.08 ± 20%      -0.0        0.09 ± 17%  perf-profile.self.cycles-pp.__srcu_read_lock
> >       0.11 ± 28%      -0.0        0.11 ± 17%      +0.0        0.12 ± 16%      -0.0        0.10 ± 17%  perf-profile.self.cycles-pp.lockref_get
> >       0.03 ± 82%      -0.0        0.03 ±100%      -0.0        0.02 ± 99%      +0.0        0.04 ± 82%  perf-profile.self.cycles-pp.may_delete
> >       0.16 ± 24%      -0.0        0.16 ± 13%      +0.0        0.19 ± 21%      +0.0        0.16 ± 17%  perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.show_type
> >       0.02 ±123%      -0.0        0.02 ±141%      +0.0        0.04 ± 45%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.rcu_nocb_try_bypass
> >       0.06 ± 23%      -0.0        0.06 ± 45%      -0.0        0.03 ±106%      -0.0        0.04 ± 50%  perf-profile.self.cycles-pp.pick_next_entity
> >       0.05 ± 50%      -0.0        0.05 ± 47%      -0.0        0.04 ± 47%      +0.0        0.05 ± 54%  perf-profile.self.cycles-pp.__update_blocked_fair
> >       0.09 ± 58%      -0.0        0.09 ± 11%      +0.0        0.11 ± 17%      +0.0        0.10 ± 21%  perf-profile.self.cycles-pp.do_dentry_open
> >       0.02 ±122%      -0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.propagate_mnt
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.malloc@plt
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.memcg_init_list_lru_one
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.place_entity
> >       0.01 ±200%      -0.0        0.01 ±223%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.siphash24_compress@plt
> >       0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.namespace_unlock
> >       0.01 ±200%      -0.0        0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__queue_work
> >       0.09 ± 17%      -0.0        0.09 ± 20%      -0.0        0.08 ± 23%      -0.0        0.08 ± 27%  perf-profile.self.cycles-pp.prepend_path
> >       0.09 ± 47%      -0.0        0.09 ± 24%      +0.0        0.10 ± 24%      +0.0        0.10 ± 19%  perf-profile.self.cycles-pp.lookup_fast
> >       0.03 ±127%      -0.0        0.02 ± 99%      +0.0        0.03 ±100%      +0.0        0.04 ± 50%  perf-profile.self.cycles-pp.vfs_create_mount
> >       0.23 ± 25%      -0.0        0.22 ±  9%      +0.0        0.24 ± 17%      +0.0        0.24 ±  4%  perf-profile.self.cycles-pp.__kmem_cache_free
> >       0.03 ± 82%      -0.0        0.03 ± 70%      -0.0        0.03 ±100%      +0.0        0.05 ± 57%  perf-profile.self.cycles-pp.ida_free
> >       0.08 ± 33%      -0.0        0.08 ± 16%      -0.0        0.08 ± 21%      +0.0        0.08 ± 17%  perf-profile.self.cycles-pp.security_inode_permission
> >       0.06 ± 56%      -0.0        0.06 ± 50%      +0.0        0.07 ± 25%      -0.0        0.06 ± 53%  perf-profile.self.cycles-pp.dequeue_entity
> >       0.12 ± 15%      +0.0        0.12 ± 13%      -0.0        0.11 ± 12%      +0.0        0.13 ± 16%  perf-profile.self.cycles-pp.string_escape_mem
> >       0.01 ±200%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.security_capable
> >       0.01 ±200%      +0.0        0.01 ±223%      -0.0        0.00            -0.0        0.00        perf-profile.self.cycles-pp.ttwu_queue_wakelist
> >       0.01 ±200%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.put_prev_entity
> >       0.01 ±200%      +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.nd_jump_root
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.object_path_is_valid
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.pick_file
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.mem_cgroup_handle_over_high
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.release_pages
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.shmem_getattr
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp._hashmap_size
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.security_inode_init_security
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.switch_fpu_return
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.lookup_constant
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.locks_remove_posix
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.stress_mwc1
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.d_alloc_parallel
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.ktime_get_mono_fast_ns
> >       0.00            +0.0        0.00            +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.apparmor_sb_mount
> >       0.01 ±200%      +0.0        0.01 ±223%      +0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.putname
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.__fsnotify_parent
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.srcu_gp_start_if_needed
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.deactivate_locked_super
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.unlink
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.evict
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.lookup_one_qstr_excl
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.__kmalloc_node_track_caller
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.chacha_block_generic
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.dentry_kill
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.perf_rotate_context
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.shmem_free_in_core_inode
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.shmem_evict_inode
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.cpuidle_governor_latency_req
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.ihold
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.timerqueue_add
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.i_callback
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.stress_ramfs_umount
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.xas_find_marked
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.__mod_memcg_lruvec_state
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.__calc_delta
> >       0.00            +0.0        0.00            +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.wake_up_bit
> >       0.07 ± 12%      +0.0        0.07 ± 16%      +0.0        0.08 ± 20%      -0.0        0.06 ± 53%  perf-profile.self.cycles-pp.path_lookupat
> >       0.01 ±200%      +0.0        0.01 ±223%      +0.0        0.02 ±142%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.vmalloc_to_page
> >       0.14 ± 19%      +0.0        0.14 ± 14%      +0.0        0.16 ± 19%      +0.0        0.15 ± 16%  perf-profile.self.cycles-pp.syscall_return_via_sysret
> >       0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.self.cycles-pp.__bitmap_set
> >       0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.00        perf-profile.self.cycles-pp.call_cpuidle
> >       0.00            +0.0        0.00            +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.clear_page_erms
> >       0.00            +0.0        0.00            +0.0        0.02 ±144%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.do_open
> >       0.00            +0.0        0.00            +0.0        0.02 ±146%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
> >       0.00            +0.0        0.00            +0.0        0.02 ± 99%      +0.0        0.00        perf-profile.self.cycles-pp.__dentry_kill
> >       0.08 ± 26%      +0.0        0.08 ± 27%      +0.0        0.11 ± 11%      +0.0        0.10 ± 13%  perf-profile.self.cycles-pp.__check_object_size
> >       0.00            +0.0        0.00            +0.0        0.04 ± 71%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.__x64_sys_umount
> >       0.05 ± 53%      +0.0        0.05 ± 46%      +0.0        0.08 ± 14%      +0.0        0.05 ± 56%  perf-profile.self.cycles-pp.propagation_next
> >       0.06 ± 53%      +0.0        0.06 ± 47%      +0.0        0.07 ± 20%      +0.0        0.07 ± 23%  perf-profile.self.cycles-pp.lockref_put_or_lock
> >       0.02 ±125%      +0.0        0.02 ±145%      +0.0        0.04 ± 72%      +0.0        0.04 ± 85%  perf-profile.self.cycles-pp.umount_tree
> >       0.02 ±125%      +0.0        0.02 ± 99%      -0.0        0.02 ±142%      -0.0        0.00        perf-profile.self.cycles-pp.inode_maybe_inc_iversion
> >       0.08 ± 17%      +0.0        0.08 ± 21%      +0.0        0.08 ±  5%      +0.0        0.09 ± 19%  perf-profile.self.cycles-pp.walk_component
> >       0.04 ± 82%      +0.0        0.04 ± 72%      +0.0        0.04 ± 71%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.rb_erase
> >       0.13 ± 22%      +0.0        0.13 ±  8%      +0.0        0.14 ± 13%      +0.0        0.14 ± 11%  perf-profile.self.cycles-pp.get_nr_inodes
> >       0.12 ± 29%      +0.0        0.12 ± 24%      +0.0        0.13 ± 11%      +0.0        0.12 ± 17%  perf-profile.self.cycles-pp.update_curr
> >       0.14 ± 16%      +0.0        0.14 ± 15%      +0.0        0.14 ± 20%      +0.0        0.14 ± 14%  perf-profile.self.cycles-pp.task_work_add
> >       0.14 ± 25%      +0.0        0.14 ± 10%      -0.0        0.12 ± 22%      +0.0        0.14 ± 25%  perf-profile.self.cycles-pp.rcu_segcblist_enqueue
> >       0.13 ± 29%      +0.0        0.13 ± 22%      +0.0        0.13 ± 14%      +0.0        0.13 ±  6%  perf-profile.self.cycles-pp.get_nr_dirty_inodes
> >       0.02 ±200%      +0.0        0.02 ±142%      +0.0        0.03 ±100%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.rcu_do_batch
> >       0.12 ± 32%      +0.0        0.12 ± 22%      -0.0        0.11 ± 21%      +0.0        0.14 ± 26%  perf-profile.self.cycles-pp.get_obj_cgroup_from_current
> >       0.01 ±200%      +0.0        0.02 ±141%      +0.0        0.02 ±141%      -0.0        0.00        perf-profile.self.cycles-pp.__wait_for_common
> >       0.07 ± 23%      +0.0        0.08 ± 12%      -0.0        0.07 ± 24%      -0.0        0.06 ± 53%  perf-profile.self.cycles-pp.task_work_run
> >       0.08 ± 20%      +0.0        0.08 ± 24%      +0.0        0.08 ± 27%      -0.0        0.08 ± 25%  perf-profile.self.cycles-pp.do_filp_open
> >       0.06 ± 14%      +0.0        0.06 ± 14%      -0.0        0.06 ± 46%      -0.0        0.05 ± 50%  perf-profile.self.cycles-pp.syscall_enter_from_user_mode
> >       0.13 ± 17%      +0.0        0.13 ± 16%      +0.0        0.14 ± 15%      +0.0        0.15 ± 12%  perf-profile.self.cycles-pp.dput
> >       0.11 ± 19%      +0.0        0.11 ± 26%      +0.0        0.12 ± 12%      +0.0        0.13 ± 23%  perf-profile.self.cycles-pp.clone_mnt
> >       0.40 ± 26%      +0.0        0.40 ±  9%      -0.0        0.38 ± 13%      +0.0        0.40 ± 16%  perf-profile.self.cycles-pp.device_read_db_internal_filename
> >       0.27 ± 13%      +0.0        0.27 ± 12%      +0.0        0.28 ± 10%      -0.0        0.25 ±  8%  perf-profile.self.cycles-pp.native_sched_clock
> >       0.01 ±200%      +0.0        0.02 ±142%      -0.0        0.01 ±223%      -0.0        0.01 ±200%  perf-profile.self.cycles-pp.check_preempt_curr
> >       0.06 ± 65%      +0.0        0.07 ± 15%      -0.0        0.05 ± 48%      -0.0        0.03 ± 82%  perf-profile.self.cycles-pp.string_table_lookup
> >       0.06 ± 51%      +0.0        0.07 ± 30%      +0.0        0.07 ± 13%      -0.0        0.06 ± 51%  perf-profile.self.cycles-pp.chacha_permute
> >       0.22 ± 20%      +0.0        0.23 ± 13%      +0.0        0.23 ± 10%      +0.0        0.25 ±  4%  perf-profile.self.cycles-pp.strlen
> >       0.01 ±200%      +0.0        0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.02 ±125%  perf-profile.self.cycles-pp.__rdgsbase_inactive
> >       0.01 ±200%      +0.0        0.02 ±141%      +0.0        0.05 ± 47%      +0.0        0.03 ± 84%  perf-profile.self.cycles-pp.update_min_vruntime
> >       0.11 ± 24%      +0.0        0.12 ± 13%      -0.0        0.11 ± 28%      -0.0        0.10 ± 20%  perf-profile.self.cycles-pp.vfs_getattr_nosec
> >       0.03 ± 81%      +0.0        0.04 ±101%      -0.0        0.00            +0.0        0.05 ± 51%  perf-profile.self.cycles-pp.cpuacct_charge
> >       0.08 ± 54%      +0.0        0.08 ± 20%      +0.0        0.08 ± 22%      -0.0        0.07 ± 13%  perf-profile.self.cycles-pp._hashmap_iterate
> >       0.12 ± 38%      +0.0        0.12 ± 14%      +0.0        0.14 ± 17%      +0.0        0.12 ± 18%  perf-profile.self.cycles-pp.siphash24_init
> >       0.06 ± 56%      +0.0        0.06 ± 14%      -0.0        0.05 ± 74%      -0.0        0.04 ± 83%  perf-profile.self.cycles-pp._hashmap_clear
> >       0.06 ± 59%      +0.0        0.06 ± 14%      +0.0        0.06 ± 14%      +0.0        0.07 ± 25%  perf-profile.self.cycles-pp.__do_sys_newfstat
> >       1.37 ± 23%      +0.0        1.38 ±  7%      -0.1        1.30 ± 14%      -0.1        1.27 ±  7%  perf-profile.self.cycles-pp.siphash24_compress
> >       0.09 ± 14%      +0.0        0.10 ± 23%      +0.0        0.10 ± 18%      +0.0        0.10 ± 20%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
> >       0.10 ± 20%      +0.0        0.11 ± 13%      +0.0        0.11 ± 14%      +0.0        0.12 ± 27%  perf-profile.self.cycles-pp.do_syscall_64
> >       0.06 ± 50%      +0.0        0.07 ± 47%      +0.0        0.08 ± 24%      +0.0        0.07 ± 21%  perf-profile.self.cycles-pp.propagate_umount
> >       0.01 ±200%      +0.0        0.02 ±142%      +0.0        0.02 ±144%      +0.0        0.03 ± 82%  perf-profile.self.cycles-pp.current_time
> >       0.06 ± 57%      +0.0        0.07 ± 49%      +0.0        0.06 ± 45%      -0.0        0.06 ± 12%  perf-profile.self.cycles-pp.rcu_exp_handler
> >       0.45 ± 16%      +0.0        0.46 ± 15%      +0.0        0.46 ± 12%      -0.0        0.44 ± 10%  perf-profile.self.cycles-pp.memcg_slab_post_alloc_hook
> >       0.01 ±200%      +0.0        0.02 ±141%      -0.0        0.01 ±223%      +0.0        0.03 ± 82%  perf-profile.self.cycles-pp.alloc_super
> >       0.06 ± 54%      +0.0        0.07 ± 16%      -0.0        0.05 ± 72%      +0.0        0.07 ± 12%  perf-profile.self.cycles-pp.path_equal
> >       0.04 ± 83%      +0.0        0.05 ± 71%      +0.0        0.06 ± 11%      -0.0        0.03 ± 84%  perf-profile.self.cycles-pp.kernfs_iop_permission
> >       0.06 ± 61%      +0.0        0.06 ± 24%      +0.0        0.07 ± 20%      +0.0        0.08 ± 13%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode
> >       0.03 ±123%      +0.0        0.03 ±111%      +0.0        0.05 ± 73%      +0.0        0.05 ± 52%  perf-profile.self.cycles-pp.kmalloc_slab
> >       0.05 ± 86%      +0.0        0.05 ± 49%      +0.0        0.07 ± 24%      +0.0        0.05 ± 54%  perf-profile.self.cycles-pp.stress_ramfs_child
> >       0.18 ± 33%      +0.0        0.18 ± 27%      +0.0        0.19 ± 14%      +0.0        0.20 ± 20%  perf-profile.self.cycles-pp.__list_del_entry_valid
> >       0.24 ± 20%      +0.0        0.25 ±  7%      -0.0        0.23 ± 21%      +0.0        0.25 ±  9%  perf-profile.self.cycles-pp.__entry_text_start
> >       0.05 ± 58%      +0.0        0.06 ± 21%      -0.0        0.04 ± 78%      -0.0        0.05 ± 52%  perf-profile.self.cycles-pp._copy_from_user
> >       0.01 ±200%      +0.0        0.02 ±146%      +0.0        0.03 ±101%      -0.0        0.00        perf-profile.self.cycles-pp.check_cpu_stall
> >       0.06 ± 23%      +0.0        0.07 ± 23%      +0.0        0.08 ± 10%      +0.0        0.08 ± 31%  perf-profile.self.cycles-pp.kernfs_dop_revalidate
> >       0.09 ± 25%      +0.0        0.10 ± 20%      -0.0        0.08 ± 21%      +0.0        0.09 ± 23%  perf-profile.self.cycles-pp.up_write
> >       0.10 ± 30%      +0.0        0.11 ± 10%      +0.0        0.12 ± 13%      +0.0        0.12 ± 25%  perf-profile.self.cycles-pp.kmem_cache_alloc_lru
> >       0.01 ±200%      +0.0        0.02 ±144%      +0.0        0.02 ±142%      +0.0        0.04 ± 83%  perf-profile.self.cycles-pp.try_to_unlazy
> >       0.34 ± 16%      +0.0        0.35 ± 12%      -0.0        0.33 ± 16%      +0.0        0.37 ±  9%  perf-profile.self.cycles-pp.__d_lookup_rcu
> >       0.21 ± 26%      +0.0        0.22 ±  6%      -0.0        0.20 ± 17%      -0.0        0.19 ± 15%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
> >       0.10 ± 23%      +0.0        0.11 ± 16%      +0.0        0.12 ± 27%      +0.0        0.12 ± 16%  perf-profile.self.cycles-pp.refill_obj_stock
> >       0.01 ±200%      +0.0        0.02 ±142%      -0.0        0.00            +0.0        0.02 ±122%  perf-profile.self.cycles-pp.kernfs_iop_getattr
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.seq_escape_mem
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.memcg_account_kmem
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.find_busiest_group
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.get_partial_node
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.available_idle_cpu
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.put_cpu_partial
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.get_page_from_freelist
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.pcpu_chunk_relocate
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.get_mountpoint
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.dbus_message_get_interface
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.string
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.01 ±200%  perf-profile.self.cycles-pp.percpu_free_rwsem
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.02 ±123%  perf-profile.self.cycles-pp.propagate_one
> >       0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.attach_recursive_mnt
> >       0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp._IO_link_in
> >       0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.show_mnt_opts
> >       0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__alloc_pages
> >       0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.x86_pmu_disable
> >       0.01 ±200%      +0.0        0.02 ±142%      +0.0        0.03 ±100%      +0.0        0.05 ± 50%  perf-profile.self.cycles-pp.__hrtimer_run_queues
> >       0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.00        perf-profile.self.cycles-pp.path_openat
> >       0.00            +0.0        0.01 ±223%      +0.0        0.02 ±141%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.path_umount
> >       0.01 ±200%      +0.0        0.02 ±142%      +0.0        0.03 ± 70%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.__hrtimer_next_event_base
> >       0.00            +0.0        0.01 ±223%      +0.0        0.03 ±100%      +0.0        0.00        perf-profile.self.cycles-pp.__unfreeze_partials
> >       0.05 ± 57%      +0.0        0.06 ± 47%      -0.0        0.03 ±103%      -0.0        0.02 ±123%  perf-profile.self.cycles-pp.alloc_fd
> >       0.14 ± 20%      +0.0        0.15 ± 23%      +0.0        0.16 ± 21%      +0.0        0.16 ± 20%  perf-profile.self.cycles-pp.free_percpu
> >       0.10 ± 16%      +0.0        0.11 ± 20%      -0.0        0.09 ± 19%      +0.0        0.10 ±  9%  perf-profile.self.cycles-pp.strcmp
> >       0.07 ± 17%      +0.0        0.08 ± 25%      +0.0        0.09 ± 26%      -0.0        0.06 ± 51%  perf-profile.self.cycles-pp.update_rq_clock_task
> >       0.09 ± 26%      +0.0        0.10 ± 17%      +0.0        0.09 ± 11%      +0.0        0.10 ± 21%  perf-profile.self.cycles-pp._IO_default_xsputn
> >       0.07 ± 53%      +0.0        0.08 ± 26%      -0.0        0.03 ±100%      -0.0        0.04 ± 85%  perf-profile.self.cycles-pp.switch_mm_irqs_off
> >       0.26 ± 94%      +0.0        0.26 ± 84%      -0.0        0.24 ±115%      +0.0        0.30 ± 78%  perf-profile.self.cycles-pp.ktime_get
> >       0.03 ± 84%      +0.0        0.04 ± 73%      -0.0        0.02 ±144%      -0.0        0.03 ± 82%  perf-profile.self.cycles-pp.sync_rcu_exp_select_cpus
> >       0.06 ± 30%      +0.0        0.07 ± 20%      -0.0        0.06 ± 17%      -0.0        0.05 ± 54%  perf-profile.self.cycles-pp.map_id_up
> >       0.00            +0.0        0.01 ±223%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.__legitimize_path
> >       0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.srcu_invoke_callbacks
> >       0.00            +0.0        0.01 ±223%      +0.0        0.01 ±223%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.__x64_sys_openat
> >       0.11 ± 30%      +0.0        0.12 ± 17%      +0.0        0.11 ± 23%      +0.0        0.12 ±  9%  perf-profile.self.cycles-pp.show_mountinfo
> >       0.06 ± 61%      +0.0        0.07 ± 25%      +0.0        0.07 ± 11%      +0.0        0.07 ± 16%  perf-profile.self.cycles-pp.finish_task_switch
> >       0.08 ± 13%      +0.0        0.09 ± 18%      -0.0        0.06 ± 48%      +0.0        0.08 ± 16%  perf-profile.self.cycles-pp.init_file
> >       0.10 ± 33%      +0.0        0.12 ± 22%      +0.0        0.12 ± 20%      +0.0        0.12 ± 17%  perf-profile.self.cycles-pp.cp_new_stat
> >       0.01 ±200%      +0.0        0.02 ± 99%      +0.0        0.04 ± 77%      -0.0        0.00        perf-profile.self.cycles-pp.tick_sched_do_timer
> >       0.32 ± 17%      +0.0        0.33 ± 12%      +0.0        0.35 ±  8%      +0.0        0.34 ± 14%  perf-profile.self.cycles-pp.__call_rcu_common
> >       0.18 ± 19%      +0.0        0.19 ± 14%      -0.0        0.17 ± 18%      -0.0        0.16 ±  6%  perf-profile.self.cycles-pp.strchr
> >       0.15 ± 25%      +0.0        0.17 ± 12%      -0.0        0.15 ± 13%      -0.0        0.14 ±  7%  perf-profile.self.cycles-pp.apparmor_file_alloc_security
> >       0.05 ± 53%      +0.0        0.07 ± 57%      +0.0        0.08 ± 14%      +0.0        0.08 ± 23%  perf-profile.self.cycles-pp.pcpu_block_update_hint_alloc
> >       0.01 ±200%      +0.0        0.03 ±100%      +0.0        0.04 ±103%      +0.1        0.07 ± 12%  perf-profile.self.cycles-pp.__bitmap_clear
> >       0.09 ± 28%      +0.0        0.10 ± 14%      -0.0        0.08 ± 29%      +0.0        0.10 ± 26%  perf-profile.self.cycles-pp.hashmap_replace
> >       0.26 ± 26%      +0.0        0.28 ± 16%      +0.1        0.32 ± 13%      +0.1        0.32 ± 17%  perf-profile.self.cycles-pp.__switch_to_asm
> >       0.06 ± 10%      +0.0        0.07 ± 51%      +0.0        0.08 ± 27%      +0.0        0.09 ± 18%  perf-profile.self.cycles-pp.inode_init_always
> >       0.04 ± 82%      +0.0        0.05 ± 71%      +0.0        0.06 ± 45%      +0.0        0.05 ± 52%  perf-profile.self.cycles-pp._raw_read_lock_irqsave
> >       0.08 ± 24%      +0.0        0.09 ± 11%      +0.0        0.08 ± 13%      -0.0        0.08 ± 21%  perf-profile.self.cycles-pp.__fxstat64
> >       0.10 ±  9%      +0.0        0.11 ± 28%      +0.0        0.10 ± 12%      +0.0        0.11 ± 19%  perf-profile.self.cycles-pp.pick_next_task_fair
> >       0.42 ±  9%      +0.0        0.43 ±  6%      +0.0        0.44 ±  6%      -0.0        0.41 ±  4%  perf-profile.self.cycles-pp.kmem_cache_alloc
> >       0.03 ±123%      +0.0        0.04 ± 73%      -0.0        0.02 ±144%      +0.0        0.04 ± 83%  perf-profile.self.cycles-pp.shmem_get_inode
> >       0.04 ± 83%      +0.0        0.05 ± 46%      +0.0        0.05 ± 45%      +0.0        0.04 ± 83%  perf-profile.self.cycles-pp.queue_work_on
> >       0.56 ± 25%      +0.0        0.58 ± 10%      -0.0        0.56 ± 12%      -0.0        0.55 ±  9%  perf-profile.self.cycles-pp.kmem_cache_free
> >       0.10 ± 13%      +0.0        0.12 ±  7%      +0.0        0.12 ± 26%      +0.0        0.12 ± 28%  perf-profile.self.cycles-pp.enqueue_entity
> >       0.05 ± 50%      +0.0        0.07 ± 19%      +0.0        0.06 ± 54%      +0.0        0.08 ± 22%  perf-profile.self.cycles-pp.__filename_parentat
> >       0.01 ±200%      +0.0        0.03 ±100%      -0.0        0.01 ±223%      -0.0        0.00        perf-profile.self.cycles-pp.strcmp@plt
> >       0.12 ± 22%      +0.0        0.14 ±  9%      +0.0        0.14 ±  8%      +0.0        0.15 ± 13%  perf-profile.self.cycles-pp.mutex_unlock
> >       0.06 ± 56%      +0.0        0.08 ± 46%      +0.0        0.07 ± 15%      +0.0        0.08 ± 17%  perf-profile.self.cycles-pp.set_next_entity
> >       0.14 ± 26%      +0.0        0.15 ± 16%      +0.0        0.14 ± 13%      -0.0        0.11 ± 11%  perf-profile.self.cycles-pp.getname_flags
> >       0.05 ± 52%      +0.0        0.06 ± 48%      +0.0        0.05 ± 75%      -0.0        0.03 ± 82%  perf-profile.self.cycles-pp.openat64
> >       0.27 ± 13%      +0.0        0.28 ± 25%      +0.0        0.30 ± 10%      +0.0        0.29 ± 13%  perf-profile.self.cycles-pp._raw_spin_lock_irq
> >       0.06 ± 50%      +0.0        0.08 ± 23%      +0.0        0.07 ± 16%      -0.0        0.06 ± 53%  perf-profile.self.cycles-pp.schedule
> >       0.06 ± 56%      +0.0        0.08 ± 22%      +0.0        0.07 ± 16%      +0.0        0.07 ± 36%  perf-profile.self.cycles-pp.path_simplify
> >       0.11 ± 25%      +0.0        0.13 ± 21%      +0.0        0.13 ± 14%      +0.0        0.11 ± 11%  perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
> >       0.00            +0.0        0.02 ±141%      +0.0        0.00            +0.0        0.00        perf-profile.self.cycles-pp.close_fd
> >       0.02 ±122%      +0.0        0.04 ±101%      +0.0        0.02 ± 99%      +0.0        0.05 ± 52%  perf-profile.self.cycles-pp.__libc_calloc
> >       0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.resched_curr
> >       0.00            +0.0        0.02 ±141%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.do_sys_openat2
> >       0.01 ±200%      +0.0        0.03 ±100%      +0.0        0.01 ±223%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.synchronize_rcu_expedited
> >       0.18 ± 24%      +0.0        0.20 ± 14%      +0.0        0.18 ± 10%      +0.0        0.20 ± 12%  perf-profile.self.cycles-pp.pcpu_alloc_area
> >       0.11 ± 24%      +0.0        0.12 ± 15%      +0.0        0.12 ± 17%      +0.0        0.12 ± 25%  perf-profile.self.cycles-pp.obj_cgroup_charge
> >       0.09 ± 41%      +0.0        0.10 ± 37%      -0.0        0.08 ± 58%      +0.0        0.09 ± 18%  perf-profile.self.cycles-pp.llist_add_batch
> >       0.08 ± 22%      +0.0        0.10 ± 31%      +0.0        0.08 ± 34%      -0.0        0.07 ± 34%  perf-profile.self.cycles-pp.__close
> >       0.08 ± 27%      +0.0        0.10 ± 19%      +0.0        0.09 ± 18%      +0.0        0.09 ±  8%  perf-profile.self.cycles-pp.make_vfsuid
> >       0.65 ± 25%      +0.0        0.66 ±  6%      +0.0        0.67 ± 17%      +0.0        0.67 ± 14%  perf-profile.self.cycles-pp.__slab_free
> >       0.01 ±200%      +0.0        0.03 ±101%      +0.0        0.02 ±142%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.strextend_with_separator
> >       0.00            +0.0        0.02 ±142%      +0.0        0.00            +0.0        0.03 ± 82%  perf-profile.self.cycles-pp.cgroup_rstat_updated
> >       0.00            +0.0        0.02 ±142%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.commit_tree
> >       0.00            +0.0        0.02 ±142%      +0.0        0.02 ±142%      +0.0        0.02 ±123%  perf-profile.self.cycles-pp.update_rq_clock
> >       0.01 ±200%      +0.0        0.03 ±100%      +0.0        0.04 ± 72%      +0.0        0.03 ± 82%  perf-profile.self.cycles-pp.rcu_exp_wait_wake
> >       0.02 ±122%      +0.0        0.04 ± 75%      +0.0        0.04 ± 44%      +0.0        0.06 ± 54%  perf-profile.self.cycles-pp.strscpy
> >       0.14 ± 17%      +0.0        0.16 ± 10%      +0.0        0.16 ± 17%      +0.0        0.15 ± 18%  perf-profile.self.cycles-pp.enqueue_task_fair
> >       0.06 ± 59%      +0.0        0.08 ± 44%      -0.0        0.06 ± 46%      -0.0        0.05 ± 51%  perf-profile.self.cycles-pp.path_hash_func
> >       0.45 ± 32%      +0.0        0.47 ± 15%      +0.0        0.50 ± 18%      +0.0        0.47 ± 15%  perf-profile.self.cycles-pp.rwsem_optimistic_spin
> >       0.08 ± 30%      +0.0        0.10 ± 25%      +0.0        0.10 ± 18%      +0.0        0.10 ± 22%  perf-profile.self.cycles-pp.string_hash_func
> >       0.01 ±200%      +0.0        0.03 ±101%      +0.0        0.03 ±100%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.apparmor_file_open
> >       0.00            +0.0        0.02 ±144%      +0.0        0.01 ±223%      +0.0        0.03 ±127%  perf-profile.self.cycles-pp.__do_sys_newlstat
> >       0.08 ± 52%      +0.0        0.10 ± 18%      +0.0        0.12 ± 13%      +0.0        0.12 ± 21%  perf-profile.self.cycles-pp.ida_alloc_range
> >       0.10 ± 21%      +0.0        0.12 ± 19%      +0.0        0.10 ± 18%      +0.0        0.11 ± 10%  perf-profile.self.cycles-pp.down_write
> >       0.00            +0.0        0.02 ±146%      +0.0        0.02 ±141%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.rmqueue
> >       0.02 ±200%      +0.0        0.04 ± 72%      +0.0        0.03 ±100%      +0.0        0.04 ± 87%  perf-profile.self.cycles-pp.security_inode_getattr
> >       0.16 ± 28%      +0.0        0.18 ± 10%      +0.0        0.18 ± 12%      +0.0        0.17 ± 10%  perf-profile.self.cycles-pp._find_next_zero_bit
> >       0.04 ± 50%      +0.0        0.06 ± 17%      +0.0        0.07 ± 10%      +0.0        0.06 ±  7%  perf-profile.self.cycles-pp.path_startswith
> >       0.56 ± 17%      +0.0        0.58 ±  5%      +0.0        0.59 ±  6%      +0.0        0.58 ±  4%  perf-profile.self.cycles-pp.link_path_walk
> >       0.45 ± 26%      +0.0        0.47 ±  9%      +0.0        0.48 ± 13%      -0.0        0.44 ±  6%  perf-profile.self.cycles-pp.path_compare
> >       0.14 ± 25%      +0.0        0.16 ± 14%      +0.0        0.16 ± 26%      +0.0        0.15 ± 21%  perf-profile.self.cycles-pp.mntput_no_expire
> >       0.10 ± 37%      +0.0        0.13 ± 32%      +0.0        0.13 ±  9%      +0.0        0.13 ± 19%  perf-profile.self.cycles-pp.alloc_vfsmnt
> >       0.07 ± 55%      +0.0        0.10 ± 23%      +0.0        0.09 ±  9%      +0.0        0.09 ± 23%  perf-profile.self.cycles-pp.apparmor_file_free_security
> >       0.04 ± 85%      +0.0        0.06 ± 32%      +0.0        0.07 ± 21%      +0.0        0.06 ± 53%  perf-profile.self.cycles-pp.free@plt
> >       0.00            +0.0        0.02 ± 99%      +0.0        0.01 ±223%      +0.0        0.00        perf-profile.self.cycles-pp.alloc_fs_context
> >       0.00            +0.0        0.02 ± 99%      +0.0        0.02 ±143%      +0.0        0.00        perf-profile.self.cycles-pp.strnlen_user
> >       0.16 ± 22%      +0.0        0.18 ± 15%      +0.0        0.18 ± 10%      +0.0        0.17 ±  8%  perf-profile.self.cycles-pp.down_read
> >       0.03 ± 84%      +0.0        0.06 ± 13%      +0.0        0.04 ± 45%      +0.0        0.04 ± 50%  perf-profile.self.cycles-pp._atomic_dec_and_lock
> >       0.29 ± 29%      +0.0        0.32 ± 12%      +0.0        0.34 ± 10%      +0.1        0.36 ± 13%  perf-profile.self.cycles-pp.__sync_rcu_exp_select_node_cpus
> >       0.10 ± 17%      +0.0        0.13 ± 10%      +0.0        0.11 ± 15%      +0.0        0.11 ± 15%  perf-profile.self.cycles-pp.memcpy_orig
> >       0.27 ± 32%      +0.0        0.30 ± 11%      +0.0        0.28 ±  9%      +0.0        0.29 ±  7%  perf-profile.self.cycles-pp.__check_heap_object
> >       0.04 ± 85%      +0.0        0.06 ± 14%      +0.0        0.07 ± 14%      +0.0        0.07 ± 34%  perf-profile.self.cycles-pp.strlen@plt
> >       0.07 ± 86%      +0.0        0.09 ± 23%      +0.0        0.08 ± 23%      +0.0        0.07 ± 18%  perf-profile.self.cycles-pp.umount2
> >       0.04 ± 83%      +0.0        0.06 ± 25%      +0.0        0.08 ± 15%      +0.0        0.07 ± 12%  perf-profile.self.cycles-pp.pcpu_next_fit_region
> >       0.13 ± 27%      +0.0        0.15 ±  9%      +0.0        0.13 ± 18%      +0.0        0.18 ± 14%  perf-profile.self.cycles-pp.kfree
> >       0.34 ± 14%      +0.0        0.37 ±  8%      +0.0        0.36 ± 16%      +0.0        0.38 ± 11%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
> >       0.17 ± 33%      +0.0        0.20 ± 29%      +0.0        0.18 ± 16%      +0.0        0.19 ±  5%  perf-profile.self.cycles-pp.__virt_addr_valid
> >       0.17 ± 36%      +0.0        0.20 ±  9%      -0.0        0.16 ± 22%      +0.0        0.17 ± 10%  perf-profile.self.cycles-pp.strchr@plt
> >       0.07 ± 25%      +0.0        0.10 ± 13%      +0.0        0.11 ± 35%      +0.0        0.11 ± 13%  perf-profile.self.cycles-pp._raw_spin_trylock
> >       0.15 ± 34%      +0.0        0.18 ± 11%      +0.0        0.17 ± 17%      +0.0        0.19 ± 11%  perf-profile.self.cycles-pp.lockref_get_not_dead
> >       0.01 ±200%      +0.0        0.04 ± 73%      +0.0        0.02 ±141%      +0.0        0.01 ±200%  perf-profile.self.cycles-pp.prepare_task_switch
> >       0.01 ±200%      +0.0        0.04 ± 75%      +0.0        0.04 ± 71%      +0.0        0.02 ±122%  perf-profile.self.cycles-pp.strlcpy
> >       0.09 ± 79%      +0.0        0.12 ± 16%      +0.0        0.10 ± 14%      +0.0        0.10 ± 26%  perf-profile.self.cycles-pp.strlcat
> >       0.07 ± 57%      +0.0        0.10 ± 18%      +0.0        0.11 ± 19%      +0.0        0.10 ± 26%  perf-profile.self.cycles-pp.__list_add_valid
> >       0.11 ± 54%      +0.0        0.14 ± 25%      +0.0        0.14 ± 23%      +0.0        0.15 ± 16%  perf-profile.self.cycles-pp.process_one_work
> >       0.04 ± 85%      +0.0        0.07 ± 14%      +0.0        0.06 ± 46%      +0.0        0.07 ± 56%  perf-profile.self.cycles-pp.memcpy@plt
> >       0.08 ± 25%      +0.0        0.12 ± 22%      +0.0        0.10 ± 23%      +0.0        0.11 ± 24%  perf-profile.self.cycles-pp.__strdup
> >       0.13 ± 27%      +0.0        0.16 ± 15%      +0.0        0.15 ± 21%      +0.0        0.14 ± 23%  perf-profile.self.cycles-pp.device_read_uevent_file
> >       0.03 ±127%      +0.0        0.06 ± 17%      +0.0        0.04 ± 77%      +0.0        0.04 ± 50%  perf-profile.self.cycles-pp.kernfs_get_target_path
> >       0.40 ± 33%      +0.0        0.44 ± 11%      +0.0        0.44 ± 19%      -0.0        0.39 ± 17%  perf-profile.self.cycles-pp.siphash24_finalize
> >       0.03 ±122%      +0.0        0.06 ± 17%      +0.1        0.09 ± 21%      +0.1        0.08 ± 24%  perf-profile.self.cycles-pp.dequeue_task_fair
> >       0.31 ± 22%      +0.0        0.34 ±  6%      +0.0        0.31 ± 21%      -0.0        0.30 ±  9%  perf-profile.self.cycles-pp.cfree
> >       0.02 ±200%      +0.0        0.05 ± 50%      +0.0        0.06 ± 54%      +0.0        0.06 ±  8%  perf-profile.self.cycles-pp.chase_symlinks
> >       0.02 ±122%      +0.0        0.06 ± 21%      +0.0        0.05 ± 47%      +0.0        0.05 ± 53%  perf-profile.self.cycles-pp.percpu_counter_add_batch
> >       0.65 ± 27%      +0.0        0.68 ± 16%      -0.0        0.64 ± 16%      +0.1        0.71 ± 10%  perf-profile.self.cycles-pp.stress_mwc32
> >       0.05 ± 82%      +0.0        0.09 ± 15%      +0.0        0.08 ± 17%      +0.1        0.10 ± 27%  perf-profile.self.cycles-pp.mutex_lock_killable
> >       0.03 ±124%      +0.0        0.07 ± 48%      +0.0        0.05 ± 77%      +0.0        0.06 ± 14%  perf-profile.self.cycles-pp.file_free_rcu
> >       0.03 ± 81%      +0.0        0.07 ± 20%      +0.0        0.08 ± 49%      +0.1        0.08 ± 24%  perf-profile.self.cycles-pp.delayed_free_vfsmnt
> >       1.34 ± 18%      +0.0        1.38 ±  6%      +0.1        1.47 ±  6%      +0.1        1.43 ±  8%  perf-profile.self.cycles-pp._raw_spin_lock
> >       0.30 ± 32%      +0.0        0.35 ±  7%      +0.0        0.34 ±  6%      +0.1        0.36 ±  4%  perf-profile.self.cycles-pp.__kmem_cache_alloc_node
> >       0.07 ± 23%      +0.0        0.12 ± 39%      +0.0        0.10 ± 41%      +0.0        0.10 ± 32%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
> >       0.19 ± 30%      +0.0        0.24 ± 20%      +0.0        0.19 ± 22%      +0.0        0.19 ±  8%  perf-profile.self.cycles-pp.device_add_property_aux
> >       0.09 ± 60%      +0.0        0.14 ± 16%      +0.1        0.15 ± 19%      +0.1        0.14 ± 14%  perf-profile.self.cycles-pp.___slab_alloc
> >       0.17 ± 29%      +0.1        0.22 ± 19%      +0.0        0.19 ± 20%      +0.0        0.18 ± 14%  perf-profile.self.cycles-pp.__legitimize_mnt
> >       0.00            +0.1        0.05 ± 50%      +0.1        0.07 ± 15%      +0.1        0.06 ± 53%  perf-profile.self.cycles-pp.init_timer_key
> >       0.27 ± 22%      +0.1        0.32 ±  9%      +0.0        0.30 ±  8%      +0.1        0.32 ± 10%  perf-profile.self.cycles-pp.step_into
> >       0.24 ± 21%      +0.1        0.30 ± 15%      +0.0        0.25 ± 21%      +0.0        0.27 ±  9%  perf-profile.self.cycles-pp.format_decode
> >       0.00            +0.1        0.06 ± 49%      +0.1        0.09 ± 21%      +0.1        0.09 ± 11%  perf-profile.self.cycles-pp.rmqueue_bulk
> >       0.26 ± 10%      +0.1        0.33 ± 23%      +0.1        0.33 ± 21%      +0.1        0.31 ± 11%  perf-profile.self.cycles-pp.__schedule
> >       0.18 ± 24%      +0.1        0.26 ±  9%      +0.1        0.25 ± 25%      +0.1        0.26 ± 16%  perf-profile.self.cycles-pp.__d_lookup
> >       0.91 ± 22%      +0.1        0.99 ± 15%      +0.1        1.05 ±  5%      +0.2        1.08 ± 12%  perf-profile.self.cycles-pp.strncpy_from_user
> >       0.00            +0.1        0.08 ± 16%      +0.1        0.08 ± 52%      +0.1        0.07 ± 20%  perf-profile.self.cycles-pp.pcpu_next_md_free_region
> >       1.18 ± 28%      +0.1        1.26 ± 13%      +0.2        1.35 ±  9%      +0.2        1.41 ±  6%  perf-profile.self.cycles-pp._find_next_bit
> >       1.03 ± 22%      +0.1        1.11 ± 13%      +0.1        1.09 ± 10%      +0.2        1.18 ±  9%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
> >       0.15 ± 23%      +0.1        0.23 ± 14%      +0.1        0.23 ± 18%      +0.1        0.23 ±  7%  perf-profile.self.cycles-pp.rcu_cblist_dequeue
> >       1.24 ± 32%      +0.1        1.33 ±  8%      +0.0        1.25 ± 13%      +0.0        1.26 ± 12%  perf-profile.self.cycles-pp.malloc
> >       0.39 ± 31%      +0.1        0.49 ± 24%      +0.1        0.47 ± 20%      +0.2        0.55 ± 32%  perf-profile.self.cycles-pp.intel_idle_irq
> >       2.44 ± 28%      +0.1        2.55 ± 11%      +0.2        2.63 ± 13%      +0.3        2.78 ± 10%  perf-profile.self.cycles-pp.stress_rndstr
> >       0.21 ± 18%      +0.2        0.36 ± 48%      +0.1        0.28 ± 84%      +0.1        0.27 ± 62%  perf-profile.self.cycles-pp.poll_idle
> >       0.00            +0.2        0.16 ± 14%      +0.2        0.20 ± 20%      +0.2        0.19 ± 13%  perf-profile.self.cycles-pp.rcu_segcblist_init
> >       0.00            +0.3        0.25 ± 13%      +0.2        0.25 ± 19%      +0.2        0.23 ± 12%  perf-profile.self.cycles-pp.init_srcu_struct_fields
> >       1.16 ± 22%      +0.9        2.05 ± 13%      +0.9        2.04 ±  9%      +0.9        2.06 ±  9%  perf-profile.self.cycles-pp.memset_orig
> >       0.57 ± 27%      +1.3        1.86 ± 28%      +1.8        2.39 ± 15%      +2.1        2.70 ±  6%  perf-profile.self.cycles-pp.pcpu_alloc
> >       0.02 ±125%      +1.5        1.49 ± 45%      +2.1        2.08 ± 21%      +2.3        2.37 ±  5%  perf-profile.self.cycles-pp.pcpu_find_block_fit
> >
> >
> >
> > >
> > > Thanks!
> > > Amir.
> > >
> > > > testcase: stress-ng
> > > > test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 128G memory
> > > > parameters:
> > > >
> > > >         nr_threads: 1
> > > >         disk: 1HDD
> > > >         testtime: 60s
> > > >         fs: ext4
> > > >         class: os
> > > >         test: ramfs
> > > >         cpufreq_governor: performance
> > > >
> > > >
> > > >
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-lkp/202306192245.d77d7216-oliver.sang@intel.com
> > > >
> > > >
> > > > Details are as below:
> > > > -------------------------------------------------------------------------------------------------->
> > > >
> > > >
> > > > To reproduce:
> > > >
> > > >         git clone https://github.com/intel/lkp-tests.git
> > > >         cd lkp-tests
> > > >         sudo bin/lkp install job.yaml           # job file is attached in this email
> > > >         bin/lkp split-job --compatible job.yaml # generate the yaml file for lkp run
> > > >         sudo bin/lkp run generated-yaml-file
> > > >
> > > >         # if come across any failure that blocks the test,
> > > >         # please remove ~/.lkp and /lkp dir to run from a clean state.
> > > >
> > > > =========================================================================================
> > > > class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
> > > >   os/gcc-12/performance/1HDD/ext4/x86_64-rhel-8.3/1/debian-11.1-x86_64-20220510.cgz/lkp-csl-d02/ramfs/stress-ng/60s
> > > >
> > > > commit:
> > > >   1af0557e94 ("fanotify: report file range info with FAN_ACCESSS_PERM")
> > > >   e796a59711 ("vfs: implement 'vfs write barriers'")
> > > >
> > > > 1af0557e94fc3d07 e796a59711433d5400947b2dbfa
> > > > ---------------- ---------------------------
> > > >          %stddev     %change         %stddev
> > > >              \          |                \
> > > >       0.14 ą  4%      -0.0        0.13 ą  5%  mpstat.cpu.all.soft%
> > > >     144866 ą  5%     -17.1%     120041 ą  5%  turbostat.C1
> > > >      10.15           +15.2%      11.70        turbostat.RAMWatt
> > > >     187740 ą  2%     -10.7%     167653 ą  2%  vmstat.system.cs
> > > >      82600            -5.3%      78240        vmstat.system.in
> > > >    1371303           -13.0%    1193418 ą  2%  stress-ng.ramfs.ops
> > > >      22854           -13.0%      19890 ą  2%  stress-ng.ramfs.ops_per_sec
> > > >    2747427           -11.6%    2429872 ą  2%  stress-ng.time.involuntary_context_switches
> > > >    3637751          +234.9%   12182075        meminfo.Memused
> > > >      17971        +48231.5%    8685746        meminfo.Percpu
> > > >      90936          +318.7%     380776        meminfo.SUnreclaim
> > > >      38661 ą  9%     -15.1%      32830        meminfo.Shmem
> > > >     185820          +155.8%     475366        meminfo.Slab
> > > >      20482         +2199.2%     470939        meminfo.VmallocUsed
> > > >    4118313          +196.0%   12189340        meminfo.max_used_kB
> > > >    3173298            -6.7%    2960000        proc-vmstat.nr_dirty_background_threshold
> > > >    6354356            -6.7%    5927238        proc-vmstat.nr_dirty_threshold
> > > >   31991368            -6.7%   29855261        proc-vmstat.nr_free_pages
> > > >      84482            -1.8%      82927        proc-vmstat.nr_inactive_anon
> > > >       9666 ą  9%     -15.1%       8208        proc-vmstat.nr_shmem
> > > >      22729          +318.8%      95193        proc-vmstat.nr_slab_unreclaimable
> > > >      84482            -1.8%      82927        proc-vmstat.nr_zone_inactive_anon
> > > >    1201688          +345.6%    5354530 ą  2%  proc-vmstat.numa_hit
> > > >    1197711          +347.0%    5353325 ą  2%  proc-vmstat.numa_local
> > > >     117966            -5.9%     110951        proc-vmstat.pgactivate
> > > >    1887107 ą  2%    +211.6%    5880960 ą  2%  proc-vmstat.pgalloc_normal
> > > >    1867687 ą  2%     -23.1%    1435439 ą  4%  proc-vmstat.pgfree
> > > >       3.47 ą  2%     +13.1%       3.92        perf-stat.i.MPKI
> > > >    2.7e+09            -1.4%  2.661e+09        perf-stat.i.branch-instructions
> > > >       2.94 ą  2%      +9.7       12.62 ą  2%  perf-stat.i.cache-miss-rate%
> > > >    1385785 ą  2%    +377.9%    6622542        perf-stat.i.cache-misses
> > > >   45772191           +14.2%   52251891        perf-stat.i.cache-references
> > > >     196041 ą  2%     -10.7%     174973 ą  2%  perf-stat.i.context-switches
> > > >     781.05 ą  2%      -8.0%     718.25 ą  3%  perf-stat.i.cpu-migrations
> > > >      26083 ą 14%     -94.4%       1461        perf-stat.i.cycles-between-cache-misses
> > > >     162575 ą  7%     +30.9%     212809 ą  3%  perf-stat.i.dTLB-load-misses
> > > >       0.01 ą  4%      +0.0        0.01 ą  3%  perf-stat.i.dTLB-store-miss-rate%
> > > >     102941 ą  3%    +119.0%     225459 ą  2%  perf-stat.i.dTLB-store-misses
> > > >  1.719e+09            +4.1%   1.79e+09        perf-stat.i.dTLB-stores
> > > >      64.33            -1.6       62.68        perf-stat.i.iTLB-load-miss-rate%
> > > >    3323983 ą  3%      -7.4%    3079335 ą  2%  perf-stat.i.iTLB-load-misses
> > > >       4052 ą  2%      +8.0%       4375 ą  2%  perf-stat.i.instructions-per-iTLB-miss
> > > >       0.07 ą 48%    +306.5%       0.27 ą 23%  perf-stat.i.major-faults
> > > >      91.27 ą  3%     +85.0%     168.88 ą  7%  perf-stat.i.metric.K/sec
> > > >     167705 ą  5%     +83.6%     307965 ą  3%  perf-stat.i.node-loads
> > > >     294581 ą  8%    +866.8%    2848095 ą 12%  perf-stat.i.node-stores
> > > >       3.45           +14.3%       3.95        perf-stat.overall.MPKI
> > > >       3.03 ą  3%      +9.7       12.68 ą  2%  perf-stat.overall.cache-miss-rate%
> > > >       6505 ą  3%     -79.1%       1359        perf-stat.overall.cycles-between-cache-misses
> > > >       0.01 ą  8%      +0.0        0.01 ą  3%  perf-stat.overall.dTLB-load-miss-rate%
> > > >       0.01 ą  3%      +0.0        0.01 ą  3%  perf-stat.overall.dTLB-store-miss-rate%
> > > >      64.58            -1.7       62.93        perf-stat.overall.iTLB-load-miss-rate%
> > > >       3994 ą  3%      +7.7%       4301 ą  2%  perf-stat.overall.instructions-per-iTLB-miss
> > > >  2.657e+09            -1.4%  2.619e+09        perf-stat.ps.branch-instructions
> > > >    1364289 ą  2%    +377.7%    6517813        perf-stat.ps.cache-misses
> > > >   45049468           +14.1%   51423471        perf-stat.ps.cache-references
> > > >     192941 ą  2%     -10.8%     172197 ą  2%  perf-stat.ps.context-switches
> > > >     768.70 ą  2%      -8.0%     706.85 ą  3%  perf-stat.ps.cpu-migrations
> > > >     160021 ą  7%     +30.9%     209447 ą  3%  perf-stat.ps.dTLB-load-misses
> > > >     101316 ą  3%    +119.0%     221881 ą  2%  perf-stat.ps.dTLB-store-misses
> > > >  1.692e+09            +4.1%  1.761e+09        perf-stat.ps.dTLB-stores
> > > >    3271471 ą  3%      -7.4%    3030527 ą  2%  perf-stat.ps.iTLB-load-misses
> > > >       0.07 ą 48%    +306.3%       0.27 ą 23%  perf-stat.ps.major-faults
> > > >     165092 ą  5%     +83.6%     303115 ą  3%  perf-stat.ps.node-loads
> > > >     290015 ą  8%    +866.5%    2802974 ą 12%  perf-stat.ps.node-stores
> > > >      10.46 ą  7%      -1.9        8.54 ą 16%  perf-profile.calltrace.cycles-pp.umount2
> > > >      10.08 ą  7%      -1.8        8.23 ą 16%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.umount2
> > > >      10.03 ą  7%      -1.8        8.19 ą 16%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> > > >       6.16 ą  8%      -1.1        5.06 ą 17%  perf-profile.calltrace.cycles-pp.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> > > >       4.23 ą  7%      -0.8        3.46 ą 17%  perf-profile.calltrace.cycles-pp.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> > > >       4.74 ą  7%      -0.8        3.98 ą  7%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > > >       3.82 ą  7%      -0.8        3.07 ą 15%  perf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> > > >       3.84 ą  7%      -0.7        3.09 ą 15%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.umount2
> > > >       4.62 ą  7%      -0.7        3.88 ą  8%  perf-profile.calltrace.cycles-pp.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
> > > >       3.80 ą  7%      -0.7        3.14 ą 16%  perf-profile.calltrace.cycles-pp.do_umount.path_umount.__x64_sys_umount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > > >       3.07 ą  6%      -0.6        2.45 ą 14%  perf-profile.calltrace.cycles-pp.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > > >       2.64 ą  6%      -0.5        2.10 ą 13%  perf-profile.calltrace.cycles-pp.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount.do_syscall_64
> > > >       2.53 ą  6%      -0.5        2.02 ą 13%  perf-profile.calltrace.cycles-pp.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount.__x64_sys_mount
> > > >       2.83 ą  7%      -0.5        2.32 ą 12%  perf-profile.calltrace.cycles-pp.stress_rndstr
> > > >       2.48 ą  7%      -0.5        1.96 ą 12%  perf-profile.calltrace.cycles-pp.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt.do_new_mount
> > > >       2.44 ą  7%      -0.5        1.94 ą 13%  perf-profile.calltrace.cycles-pp.clone_mnt.copy_tree.propagate_one.propagate_mnt.attach_recursive_mnt
> > > >       2.39 ą  8%      -0.5        1.91 ą 16%  perf-profile.calltrace.cycles-pp.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop.exit_to_user_mode_prepare
> > > >       2.11 ą  7%      -0.4        1.68 ą 12%  perf-profile.calltrace.cycles-pp.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one.propagate_mnt
> > > >       1.31 ą  9%      -0.4        0.88 ą 16%  perf-profile.calltrace.cycles-pp.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super.vfs_get_tree
> > > >       1.85 ą  8%      -0.4        1.46 ą 11%  perf-profile.calltrace.cycles-pp.unlink
> > > >       1.20 ą  9%      -0.4        0.81 ą 16%  perf-profile.calltrace.cycles-pp.pcpu_alloc.__percpu_init_rwsem.alloc_super.sget_fc.vfs_get_super
> > > >       1.77 ą  9%      -0.4        1.39 ą 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
> > > >       1.77 ą  8%      -0.4        1.40 ą 11%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.unlink
> > > >       1.74 ą  9%      -0.4        1.38 ą 11%  perf-profile.calltrace.cycles-pp.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
> > > >       1.40 ą  9%      -0.3        1.05 ą 15%  perf-profile.calltrace.cycles-pp.pcpu_alloc.alloc_vfsmnt.clone_mnt.copy_tree.propagate_one
> > > >       1.59 ą  8%      -0.3        1.26 ą 11%  perf-profile.calltrace.cycles-pp.do_unlinkat.__x64_sys_unlink.do_syscall_64.entry_SYSCALL_64_after_hwframe.unlink
> > > >       0.66 ą 12%      -0.3        0.37 ą 70%  perf-profile.calltrace.cycles-pp.vfs_create_mount.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > > >       0.86 ą 12%      -0.3        0.58 ą 46%  perf-profile.calltrace.cycles-pp.srcu_advance_state.process_srcu.process_one_work.worker_thread.kthread
> > > >       0.87 ą  9%      -0.3        0.60 ą 46%  perf-profile.calltrace.cycles-pp.unregister_shrinker.deactivate_locked_super.cleanup_mnt.task_work_run.exit_to_user_mode_loop
> > > >       0.83 ą  6%      -0.2        0.58 ą 45%  perf-profile.calltrace.cycles-pp.shmem_fill_super.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
> > > >       0.78 ą 12%      -0.2        0.54 ą 45%  perf-profile.calltrace.cycles-pp.try_check_zero.srcu_advance_state.process_srcu.process_one_work.worker_thread
> > > >       0.75 ą  7%      -0.2        0.51 ą 45%  perf-profile.calltrace.cycles-pp.lookup_open.open_last_lookups.path_openat.do_filp_open.do_sys_openat2
> > > >       1.07 ą  7%      -0.2        0.84 ą 17%  perf-profile.calltrace.cycles-pp.sync_rcu_exp_select_cpus.wait_rcu_exp_gp.process_one_work.worker_thread.kthread
> > > >       0.59 ą  2%      -0.2        0.36 ą 70%  perf-profile.calltrace.cycles-pp.__sync_rcu_exp_select_node_cpus.process_one_work.worker_thread.kthread.ret_from_fork
> > > >       1.08 ą  6%      -0.2        0.85 ą 17%  perf-profile.calltrace.cycles-pp.wait_rcu_exp_gp.process_one_work.worker_thread.kthread.ret_from_fork
> > > >       1.03 ą 11%      -0.2        0.80 ą 16%  perf-profile.calltrace.cycles-pp.strncpy_from_user.getname_flags.user_path_at_empty.__x64_sys_umount.do_syscall_64
> > > >       0.73 ą  4%      -0.2        0.52 ą 46%  perf-profile.calltrace.cycles-pp.mnt_get_count.mntput_no_expire.namespace_unlock.do_umount.path_umount
> > > >       0.69 ą  7%      -0.2        0.49 ą 44%  perf-profile.calltrace.cycles-pp.do_rmdir.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
> > > >       1.03 ą  3%      -0.2        0.84 ą 16%  perf-profile.calltrace.cycles-pp.mntput_no_expire.namespace_unlock.do_umount.path_umount.__x64_sys_umount
> > > >       0.92 ą  7%      -0.2        0.75 ą  9%  perf-profile.calltrace.cycles-pp.open_last_lookups.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat
> > > >       1.09            -0.2        0.92 ą  6%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
> > > >       1.10            -0.2        0.94 ą  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__lxstat64
> > > >       1.19            -0.2        1.04 ą  6%  perf-profile.calltrace.cycles-pp.__lxstat64
> > > >       0.85 ą 11%      -0.2        0.69 ą  7%  perf-profile.calltrace.cycles-pp.rmdir
> > > >       1.06            -0.2        0.90 ą  6%  perf-profile.calltrace.cycles-pp.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
> > > >       0.78 ą 10%      -0.1        0.63 ą  6%  perf-profile.calltrace.cycles-pp.__x64_sys_rmdir.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
> > > >       0.79 ą 11%      -0.1        0.65 ą  5%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.rmdir
> > > >       0.79 ą 11%      -0.1        0.65 ą  5%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.rmdir
> > > >       0.94 ą  3%      -0.1        0.80 ą  8%  perf-profile.calltrace.cycles-pp.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe.__lxstat64
> > > >       0.74 ą  3%      -0.1        0.64 ą  7%  perf-profile.calltrace.cycles-pp.vfs_statx.vfs_fstatat.__do_sys_newlstat.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > > >       0.64 ą 12%      +0.1        0.78 ą 14%  perf-profile.calltrace.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balance
> > > >       1.07 ą 10%      +0.2        1.24 ą 11%  perf-profile.calltrace.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
> > > >       1.06 ą  9%      +0.2        1.24 ą 11%  perf-profile.calltrace.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.common_nsleep
> > > >       1.18 ą  9%      +0.2        1.37 ą  9%  perf-profile.calltrace.cycles-pp.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64
> > > >       1.20 ą 10%      +0.2        1.40 ą  9%  perf-profile.calltrace.cycles-pp.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > > >       1.20 ą 10%      +0.2        1.40 ą  9%  perf-profile.calltrace.cycles-pp.common_nsleep.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> > > >       1.24 ą 11%      +0.2        1.45 ą 10%  perf-profile.calltrace.cycles-pp.__x64_sys_clock_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> > > >       1.26 ą 11%      +0.2        1.47 ą 10%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> > > >       1.27 ą 11%      +0.2        1.48 ą 10%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.clock_nanosleep
> > > >       1.34 ą 11%      +0.2        1.58 ą  9%  perf-profile.calltrace.cycles-pp.clock_nanosleep
> > > >       0.00            +0.8        0.79 ą 20%  perf-profile.calltrace.cycles-pp.memset_orig.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc
> > > >       0.00            +1.6        1.61 ą 31%  perf-profile.calltrace.cycles-pp.pcpu_find_block_fit.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc
> > > >       9.19 ą  7%      +3.2       12.40 ą 11%  perf-profile.calltrace.cycles-pp.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
> > > >       9.28 ą  7%      +3.2       12.49 ą 11%  perf-profile.calltrace.cycles-pp.mount
> > > >       9.21 ą  7%      +3.2       12.43 ą 11%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
> > > >       9.23 ą  7%      +3.2       12.44 ą 11%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.mount
> > > >       8.33 ą  7%      +3.4       11.70 ą 11%  perf-profile.calltrace.cycles-pp.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe.mount
> > > >       3.18 ą  6%      +4.3        7.52 ą 14%  perf-profile.calltrace.cycles-pp.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64
> > > >       3.19 ą  6%      +4.3        7.54 ą 14%  perf-profile.calltrace.cycles-pp.vfs_get_tree.do_new_mount.__x64_sys_mount.do_syscall_64.entry_SYSCALL_64_after_hwframe
> > > >       0.00            +4.5        4.48 ą 22%  perf-profile.calltrace.cycles-pp.pcpu_alloc.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_super
> > > >       1.87 ą  8%      +4.6        6.48 ą 15%  perf-profile.calltrace.cycles-pp.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount.__x64_sys_mount
> > > >       1.73 ą  9%      +4.6        6.37 ą 16%  perf-profile.calltrace.cycles-pp.alloc_super.sget_fc.vfs_get_super.vfs_get_tree.do_new_mount
> > > >       0.00            +5.1        5.13 ą 19%  perf-profile.calltrace.cycles-pp.init_srcu_struct_fields.alloc_super.sget_fc.vfs_get_super.vfs_get_tree
> > > >      10.53 ą  7%      -1.9        8.60 ą 16%  perf-profile.children.cycles-pp.umount2
> > > >       6.16 ą  8%      -1.1        5.06 ą 17%  perf-profile.children.cycles-pp.__x64_sys_umount
> > > >       4.24 ą  7%      -0.8        3.46 ą 17%  perf-profile.children.cycles-pp.path_umount
> > > >       4.77 ą  7%      -0.7        4.09 ą  6%  perf-profile.children.cycles-pp.task_work_run
> > > >       3.07 ą  6%      -0.6        2.46 ą 14%  perf-profile.children.cycles-pp.attach_recursive_mnt
> > > >       2.71 ą  7%      -0.6        2.13 ą 12%  perf-profile.children.cycles-pp.alloc_vfsmnt
> > > >       3.03 ą  7%      -0.5        2.48 ą 12%  perf-profile.children.cycles-pp.stress_rndstr
> > > >       2.64 ą  6%      -0.5        2.10 ą 13%  perf-profile.children.cycles-pp.propagate_mnt
> > > >       2.54 ą  7%      -0.5        2.02 ą 13%  perf-profile.children.cycles-pp.propagate_one
> > > >       2.48 ą  7%      -0.5        1.97 ą 12%  perf-profile.children.cycles-pp.copy_tree
> > > >       2.45 ą  7%      -0.5        1.96 ą 12%  perf-profile.children.cycles-pp.clone_mnt
> > > >       2.39 ą  8%      -0.5        1.91 ą 16%  perf-profile.children.cycles-pp.deactivate_locked_super
> > > >       1.31 ą  9%      -0.4        0.89 ą 16%  perf-profile.children.cycles-pp.__percpu_init_rwsem
> > > >       1.86 ą  8%      -0.4        1.47 ą 11%  perf-profile.children.cycles-pp.unlink
> > > >       2.50 ą  8%      -0.4        2.12 ą  8%  perf-profile.children.cycles-pp.getname_flags
> > > >       1.75 ą  9%      -0.4        1.38 ą 11%  perf-profile.children.cycles-pp.__x64_sys_unlink
> > > >       1.76 ą  8%      -0.3        1.41 ą 15%  perf-profile.children.cycles-pp.mnt_get_count
> > > >       1.59 ą  8%      -0.3        1.26 ą 11%  perf-profile.children.cycles-pp.do_unlinkat
> > > >       1.90 ą  8%      -0.3        1.59 ą  7%  perf-profile.children.cycles-pp.strncpy_from_user
> > > >       1.33 ą  8%      -0.3        1.07 ą  3%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
> > > >       1.36 ą  9%      -0.3        1.10 ą 14%  perf-profile.children.cycles-pp.kmem_cache_alloc_lru
> > > >       0.89 ą 13%      -0.2        0.64 ą 20%  perf-profile.children.cycles-pp.__wait_for_common
> > > >       1.07 ą  7%      -0.2        0.84 ą 17%  perf-profile.children.cycles-pp.sync_rcu_exp_select_cpus
> > > >       1.08 ą  6%      -0.2        0.85 ą 17%  perf-profile.children.cycles-pp.wait_rcu_exp_gp
> > > >       0.97 ą  5%      -0.2        0.74 ą 13%  perf-profile.children.cycles-pp.__filename_parentat
> > > >       0.90 ą  5%      -0.2        0.68 ą 13%  perf-profile.children.cycles-pp.path_parentat
> > > >       0.86 ą 11%      -0.2        0.67 ą 15%  perf-profile.children.cycles-pp.srcu_advance_state
> > > >       0.82 ą 12%      -0.2        0.64 ą 15%  perf-profile.children.cycles-pp.try_check_zero
> > > >       0.93 ą  8%      -0.2        0.74 ą 14%  perf-profile.children.cycles-pp.slab_pre_alloc_hook
> > > >       0.67 ą 14%      -0.2        0.49 ą 18%  perf-profile.children.cycles-pp.schedule_timeout
> > > >       0.93 ą 10%      -0.2        0.75 ą 17%  perf-profile.children.cycles-pp.alloc_inode
> > > >       0.83 ą  6%      -0.2        0.65 ą 17%  perf-profile.children.cycles-pp.shmem_fill_super
> > > >       0.93 ą  7%      -0.2        0.76 ą  8%  perf-profile.children.cycles-pp.open_last_lookups
> > > >       1.24            -0.2        1.07 ą  6%  perf-profile.children.cycles-pp.__lxstat64
> > > >       0.88 ą  5%      -0.2        0.71 ą 11%  perf-profile.children.cycles-pp.__check_object_size
> > > >       0.75 ą  7%      -0.2        0.60 ą 10%  perf-profile.children.cycles-pp.lookup_open
> > > >       0.86 ą 10%      -0.2        0.70 ą  6%  perf-profile.children.cycles-pp.rmdir
> > > >       0.66 ą 12%      -0.2        0.51 ą 15%  perf-profile.children.cycles-pp.vfs_create_mount
> > > >       1.07            -0.2        0.92 ą  7%  perf-profile.children.cycles-pp.__do_sys_newlstat
> > > >       0.78 ą 10%      -0.1        0.63 ą  6%  perf-profile.children.cycles-pp.__x64_sys_rmdir
> > > >       0.69 ą  5%      -0.1        0.56 ą 11%  perf-profile.children.cycles-pp.__d_alloc
> > > >       0.73 ą  2%      -0.1        0.60 ą 15%  perf-profile.children.cycles-pp.__sync_rcu_exp_select_node_cpus
> > > >       0.69 ą  7%      -0.1        0.57 ą  8%  perf-profile.children.cycles-pp.do_rmdir
> > > >       0.41 ą  4%      -0.1        0.30 ą 17%  perf-profile.children.cycles-pp.xas_store
> > > >       0.16 ą 22%      -0.1        0.06 ą 60%  perf-profile.children.cycles-pp.pcpu_block_refresh_hint
> > > >       0.47 ą  9%      -0.1        0.38 ą 13%  perf-profile.children.cycles-pp.d_alloc
> > > >       0.41 ą 10%      -0.1        0.33 ą 12%  perf-profile.children.cycles-pp.truncate_inode_pages_range
> > > >       0.39 ą  5%      -0.1        0.32 ą 13%  perf-profile.children.cycles-pp.check_heap_object
> > > >       0.39 ą  4%      -0.1        0.32 ą 15%  perf-profile.children.cycles-pp.list_lru_destroy
> > > >       0.33 ą  5%      -0.1        0.27 ą 14%  perf-profile.children.cycles-pp.memcg_destroy_list_lru
> > > >       0.24 ą  7%      -0.1        0.17 ą 14%  perf-profile.children.cycles-pp.finish_task_switch
> > > >       0.16 ą  9%      -0.1        0.10 ą 28%  perf-profile.children.cycles-pp.change_mnt_propagation
> > > >       0.60 ą  8%      -0.1        0.54 ą  5%  perf-profile.children.cycles-pp.__dentry_kill
> > > >       0.24 ą 11%      -0.1        0.18 ą 21%  perf-profile.children.cycles-pp.__virt_addr_valid
> > > >       0.24 ą 15%      -0.1        0.18 ą 12%  perf-profile.children.cycles-pp.security_capable
> > > >       0.23 ą  3%      -0.1        0.17 ą  9%  perf-profile.children.cycles-pp.copy_mount_options
> > > >       0.18 ą  5%      -0.1        0.12 ą 21%  perf-profile.children.cycles-pp.memcg_init_list_lru_one
> > > >       0.09 ą 15%      -0.0        0.04 ą 73%  perf-profile.children.cycles-pp.mnt_release_group_id
> > > >       0.22 ą  6%      -0.0        0.18 ą 21%  perf-profile.children.cycles-pp.fsnotify_grab_connector
> > > >       0.11 ą 16%      -0.0        0.07 ą 24%  perf-profile.children.cycles-pp.syscall_enter_from_user_mode
> > > >       0.12 ą 25%      -0.0        0.08 ą 21%  perf-profile.children.cycles-pp.__smp_call_single_queue
> > > >       0.18 ą  5%      -0.0        0.14 ą 23%  perf-profile.children.cycles-pp.wq_worker_sleeping
> > > >       0.12 ą 11%      +0.0        0.16 ą 15%  perf-profile.children.cycles-pp.read_tsc
> > > >       0.08 ą  9%      +0.1        0.14 ą 28%  perf-profile.children.cycles-pp.tick_nohz_next_event
> > > >       0.15 ą  6%      +0.1        0.22 ą 18%  perf-profile.children.cycles-pp.tick_nohz_get_sleep_length
> > > >       0.00            +0.1        0.07 ą 20%  perf-profile.children.cycles-pp.pcpu_chunk_refresh_hint
> > > >       0.00            +0.1        0.08 ą 14%  perf-profile.children.cycles-pp.init_timer_key
> > > >       0.00            +0.1        0.10 ą 29%  perf-profile.children.cycles-pp.rmqueue_bulk
> > > >       0.04 ą 50%      +0.2        0.21 ą 19%  perf-profile.children.cycles-pp.get_page_from_freelist
> > > >       0.00            +0.2        0.18 ą 19%  perf-profile.children.cycles-pp.rcu_segcblist_init
> > > >       0.00            +0.2        0.18 ą 20%  perf-profile.children.cycles-pp.rmqueue
> > > >       0.08 ą  9%      +0.2        0.26 ą 11%  perf-profile.children.cycles-pp.__alloc_pages
> > > >       1.18 ą  9%      +0.2        1.37 ą  9%  perf-profile.children.cycles-pp.do_nanosleep
> > > >       1.20 ą 10%      +0.2        1.40 ą  9%  perf-profile.children.cycles-pp.hrtimer_nanosleep
> > > >       1.21 ą 10%      +0.2        1.41 ą  9%  perf-profile.children.cycles-pp.common_nsleep
> > > >       1.24 ą 11%      +0.2        1.45 ą 10%  perf-profile.children.cycles-pp.__x64_sys_clock_nanosleep
> > > >       0.00            +0.2        0.22 ą 19%  perf-profile.children.cycles-pp.pcpu_alloc_pages
> > > >       1.35 ą 11%      +0.2        1.59 ą  9%  perf-profile.children.cycles-pp.clock_nanosleep
> > > >       0.00            +0.3        0.27 ą 18%  perf-profile.children.cycles-pp.pcpu_populate_chunk
> > > >       0.00            +0.3        0.33 ą 16%  perf-profile.children.cycles-pp.pcpu_balance_populated
> > > >       0.00            +0.3        0.34 ą 15%  perf-profile.children.cycles-pp.pcpu_balance_workfn
> > > >       1.41 ą  7%      +0.5        1.95 ą 12%  perf-profile.children.cycles-pp.memset_orig
> > > >       0.12 ą 21%      +1.6        1.70 ą 30%  perf-profile.children.cycles-pp.pcpu_find_block_fit
> > > >       9.20 ą  7%      +3.2       12.41 ą 11%  perf-profile.children.cycles-pp.__x64_sys_mount
> > > >       9.29 ą  7%      +3.2       12.51 ą 11%  perf-profile.children.cycles-pp.mount
> > > >       8.34 ą  7%      +3.4       11.70 ą 11%  perf-profile.children.cycles-pp.do_new_mount
> > > >       3.22 ą  9%      +3.6        6.81 ą 15%  perf-profile.children.cycles-pp.pcpu_alloc
> > > >       3.18 ą  6%      +4.3        7.52 ą 14%  perf-profile.children.cycles-pp.vfs_get_super
> > > >       3.19 ą  6%      +4.3        7.54 ą 14%  perf-profile.children.cycles-pp.vfs_get_tree
> > > >       1.87 ą  8%      +4.6        6.48 ą 15%  perf-profile.children.cycles-pp.sget_fc
> > > >       1.73 ą  9%      +4.6        6.37 ą 16%  perf-profile.children.cycles-pp.alloc_super
> > > >       0.00            +5.1        5.14 ą 19%  perf-profile.children.cycles-pp.init_srcu_struct_fields
> > > >       2.80 ą  7%      -0.5        2.30 ą 13%  perf-profile.self.cycles-pp.stress_rndstr
> > > >       1.30 ą  6%      -0.3        1.04 ą 16%  perf-profile.self.cycles-pp.mnt_get_count
> > > >       1.25 ą  7%      -0.2        1.02 ą  4%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
> > > >       1.08 ą 10%      -0.1        0.93 ą  7%  perf-profile.self.cycles-pp.strncpy_from_user
> > > >       0.61 ą 12%      -0.1        0.48 ą 16%  perf-profile.self.cycles-pp.try_check_zero
> > > >       0.63 ą  8%      -0.1        0.50 ą 17%  perf-profile.self.cycles-pp.mnt_get_writers
> > > >       0.68 ą  6%      -0.1        0.58 ą  4%  perf-profile.self.cycles-pp.link_path_walk
> > > >       0.40 ą  3%      -0.1        0.32 ą 15%  perf-profile.self.cycles-pp.__sync_rcu_exp_select_node_cpus
> > > >       0.15 ą 14%      -0.1        0.08 ą 51%  perf-profile.self.cycles-pp.xas_store
> > > >       0.29 ą  6%      -0.1        0.22 ą 18%  perf-profile.self.cycles-pp.inode_permission
> > > >       0.16 ą 12%      -0.0        0.12 ą 18%  perf-profile.self.cycles-pp.filename_lookup
> > > >       0.06 ą  6%      -0.0        0.03 ą 70%  perf-profile.self.cycles-pp.cpuidle_idle_call
> > > >       0.12 ą 11%      +0.0        0.15 ą 16%  perf-profile.self.cycles-pp.read_tsc
> > > >       0.04 ą 83%      +0.0        0.08 ą 12%  perf-profile.self.cycles-pp.delayed_free_vfsmnt
> > > >       0.00            +0.1        0.07 ą 15%  perf-profile.self.cycles-pp.init_timer_key
> > > >       0.00            +0.2        0.16 ą 19%  perf-profile.self.cycles-pp.rcu_segcblist_init
> > > >       0.00            +0.2        0.24 ą 14%  perf-profile.self.cycles-pp.init_srcu_struct_fields
> > > >       1.28 ą  8%      +0.5        1.79 ą 11%  perf-profile.self.cycles-pp.memset_orig
> > > >       0.69 ą 17%      +1.3        2.00 ą 26%  perf-profile.self.cycles-pp.pcpu_alloc
> > > >       0.04 ą 85%      +1.6        1.62 ą 31%  perf-profile.self.cycles-pp.pcpu_find_block_fit
> > > >
> > > >
> > > >
> > > >
> > > > Disclaimer:
> > > > Results have been estimated based on internal Intel analysis and are provided
> > > > for informational purposes only. Any difference in system hardware or software
> > > > design or configuration may affect actual performance.
> > > >
> > > >
> > > > --
> > > > 0-DAY CI Kernel Test Service
> > > > https://github.com/intel/lkp-tests/wiki
> > > >
> > > >
> > >
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
