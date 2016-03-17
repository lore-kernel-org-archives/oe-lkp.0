Content-Type: multipart/mixed; boundary="===============6802273937758436835=="
MIME-Version: 1.0
From: Joerg Roedel <jroedel@suse.de>
To: lkp@lists.01.org
Subject: Re: [of] 854fc7d606: kmsg.dt-test###FAIL_of_unittest_parse_phandle_with_args():#of_count_phandle_with_args()returned-#, expected
Date: Thu, 17 Mar 2016 12:48:32 +0100
Message-ID: <20160317114832.GB30679@suse.de>
In-Reply-To: <20160317061945.GF1670@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6802273937758436835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 17, 2016 at 02:19:45PM +0800, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://github.com/0day-ci/linux Joerg-Roedel/of-Implement-iterator-for-p=
handles/20160317-004643
> commit 854fc7d60637a7eac7bb1b43789c7901bfa70cff ("of: Implement iterator =
for phandles")
> =

> As below, the log "### dt-test ### FAIL of_unittest_parse_phandle_with_ar=
gs():300 of_count_phandle_with_args() returned -2, expected 7"
> showed with your commit.

Thanks for the report. I fixed it in my tree, all unittests pass now.


	Joerg


--===============6802273937758436835==--

