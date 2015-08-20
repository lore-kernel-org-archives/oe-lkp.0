Content-Type: multipart/mixed; boundary="===============7401780472704829201=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: How to run well about the Linux Kernel Performance tests
Date: Fri, 21 Aug 2015 06:36:57 +0800
Message-ID: <1440110217.24018.7.camel@intel.com>
In-Reply-To: <1cc96fad.d14.14f49ef08fd.Coremail.xiaoluoyuan@163.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7401780472704829201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Xly,

On Thu, 2015-08-20 at 15:07 +0800, xly wrote:
> =

> Hi,
> 	 Ying, Fengguang and Tim
> =

> I belong to the  OS Labs in Tsinghua univ. =

> =

> I run the lkp-tests on Ubuntu 14.04. and  I had a few problems:
> =

> 1) After I run the command "lkp split-job =

> $LKP_SRC/jobs/hackbench.yaml"=EF=BC=8C I get the following error message,=
 How =

> should I fix it ?
> =

> /usr/lib/ruby/1.9.1/rubygems/custom_require.rb:36:in `require': =

> cannot load such file -- /home/chy/lkp-tests/lib/assert (LoadError)
> 	from /usr/lib/ruby/1.9.1/rubygems/custom_require.rb:36:in =

> `require'
> 	from /home/chy/lkp-tests/lib/lkp_git.rb:15:in `<top =

> (required)>'
> 	from /usr/lib/ruby/1.9.1/rubygems/custom_require.rb:36:in =

> `require'
> 	from /usr/lib/ruby/1.9.1/rubygems/custom_require.rb:36:in =

> `require'
> 	from /home/chy/lkp-tests/lib/result.rb:6:in `<top =

> (required)>'
> 	from /usr/lib/ruby/1.9.1/rubygems/custom_require.rb:36:in =

> `require'
> 	from /usr/lib/ruby/1.9.1/rubygems/custom_require.rb:36:in =

> `require'
> 	from /home/chy/lkp-tests/lib/job.rb:7:in `<top (required)>'
> 	from /usr/lib/ruby/1.9.1/rubygems/custom_require.rb:36:in =

> `require'
> 	from /usr/lib/ruby/1.9.1/rubygems/custom_require.rb:36:in =

> `require'
> 	from /home/chy/lkp-tests/sbin/split-job:5:in `<main>'

Thanks for reporting, we just fixed it.  Please check whether upstream
git has fixed this now.
 =

> 2) After the command "lkp result hackbench" to check result , there =

> are a lot of files in the directory =

> "/result/hackbench/xxx/ubuntu/defconfig/gcc-4.8/3.13.0-24
> -generic/0/".
> and how to analysis these files?

In fact, we have parsed these files.  The *.json.* file are parsed
results.  And you can compare the result of different commit, etc. with
sbin/compare.

> Thanks for Linux Kernel Performance tests Project=EF=BC=81

You are welcome!

Best Regards,
Huang, Ying


--===============7401780472704829201==--

