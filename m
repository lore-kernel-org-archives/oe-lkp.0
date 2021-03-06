Content-Type: multipart/mixed; boundary="===============6037625491229418572=="
MIME-Version: 1.0
From: Williams, Dan J <dan.j.williams@intel.com>
To: lkp@lists.01.org
Subject: Re: [block] 52f019d43c: ndctl.test-libndctl.fail
Date: Sat, 06 Mar 2021 20:33:04 +0000
Message-ID: <6f40b1f53c029788e20fe175618d8772e36d648c.camel@intel.com>
In-Reply-To: <20210305074204.GA17414@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============6037625491229418572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-03-05 at 08:42 +0100, Christoph Hellwig wrote:
> Dan,
> =

> can you make any sense of thos report?
[..]
> > check_set_config_data: dimm: 0 read2 data miscompare: 0
> > check_set_config_data: dimm: 0x1 read2 data miscompare: 0
> > check_set_config_data: dimm: 0x100 read2 data miscompare: 0
> > check_set_config_data: dimm: 0x101 read2 data miscompare: 0
> > check_dax_autodetect: dax_ndns: 0x558a74d92f00 ndns: 0x558a74d92f00
> > check_dax_autodetect: dax_ndns: 0x558a74d91f40 ndns: 0x558a74d91f40
> > check_pfn_autodetect: pfn_ndns: 0x558a74d91f40 ndns: 0x558a74d91f40
> > check_pfn_autodetect: pfn_ndns: 0x558a74d8c5e0 ndns: 0x558a74d8c5e0
> > check_btt_autodetect: btt_ndns: 0x558a74d8c5e0 ndns: 0x558a74d8c5e0
> > check_btt_autodetect: btt_ndns: 0x558a74da1390 ndns: 0x558a74da1390
> > check_btt_autodetect: btt_ndns: 0x558a74d8c5e0 ndns: 0x558a74d8c5e0
> > check_btt_autodetect: btt_ndns: 0x558a74d91f40 ndns: 0x558a74d91f40
> > namespace7.0: failed to write /dev/pmem7
> > check_namespaces: namespace7.0 validate_bdev failed
> > ndctl-test1 failed: -6
> > libkmod: ERROR ../libkmod/libkmod-module.c:793 kmod_module_remove_modul=
e: could not remove 'nfit_test': Resource temporarily unavailable
> > test-libndctl: FAIL

Yes, it looks like my unit test checks for exactly the behavior you
changed. It was convenient to test that the device could be switched
back to rw via BLKROSET, but I don't require that. The new behaviour of
letting the disk->ro take precedence makes more sense to me, so I'll
update the test for the new behaviour.

I.e. I don't think regressing a unit test counts as a userspace
regression.

--===============6037625491229418572==--

