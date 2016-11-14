Content-Type: multipart/mixed; boundary="===============0346405544431301414=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/copy_user] adb402cd14: will-it-scale.per_process_ops -12.7% regression
Date: Mon, 14 Nov 2016 22:37:11 +0800
Message-ID: <20161114143711.GB2852@yexl-desktop>
In-Reply-To: <20161107095631.truqvpqong3ixwp3@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============0346405544431301414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/07, Borislav Petkov wrote:
>On Mon, Nov 07, 2016 at 10:50:38AM +0800, kernel test robot wrote:
>> To reproduce:
>> =

>>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-=
tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>
>./bin/lkp install job.yaml
>Use: /root/lkp/lkp-tests/distro/installer/debian install bc gawk time kmod=
 gzip make automake gcc build-essential libtool patch git openssl ca-certif=
icates rsync cpio wget libklibc-dev linux-libc-dev linux-libc-dev:i386 libc=
6-dev libc6-dev:i386
>Reading package lists... Done
>Building dependency tree
>Reading state information... Done
>E: Unable to locate package linux-libc-dev
>E: Unable to locate package libc6-dev
>Cannot install some packages in /root/lkp/lkp-tests/distro/depends/lkp
>
>This wants i386 flavors and can't find them for some reason...
>

Below cmd should help on it:

dpkg --add-architecture i386 && apt-get update

>>         bin/lkp run     job.yaml
>
>With your scripts I get:
>
>$  ./bin/lkp run job.yaml
>/usr/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:55:in `require': c=
annot load such file -- git (LoadError)
>        from /usr/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:55:in=
 `require'
>        from /root/lkp/lkp-tests/lib/git_ext.rb:7:in `<top (required)>'
>        from /usr/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:55:in=
 `require'
>        from /usr/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:55:in=
 `require'
>        from /root/lkp/lkp-tests/lib/lkp_git.rb:14:in `<top (required)>'
>        from /usr/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:55:in=
 `require'
>        from /usr/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:55:in=
 `require'
>        from /root/lkp/lkp-tests/lib/stats.rb:9:in `<top (required)>'
>        from /usr/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:55:in=
 `require'
>        from /usr/lib/ruby/2.3.0/rubygems/core_ext/kernel_require.rb:55:in=
 `require'
>        from /root/lkp/lkp-tests/bin/run-local:15:in `<main>'
>
>and that line is:
>
>require 'git'
>

It requires to install ruby-git package, try

sudo apt-get install ruby-git

Thanks,
Xiaolong
>but I already have ruby git bindings installed.
>
>So how can I run the benchmark directly, without the ruby glue? I
>already have a debian partition on this SNB box so I can run it
>natively.
>
>Thanks.
>
>-- =

>Regards/Gruss,
>    Boris.
>
>Good mailing practices for 400: avoid top-posting and trim the reply.

--===============0346405544431301414==--

