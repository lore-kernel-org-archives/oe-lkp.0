Content-Type: multipart/mixed; boundary="===============6410788720587164635=="
MIME-Version: 1.0
From: Jeff Moyer <jmoyer@redhat.com>
To: lkp@lists.01.org
Subject: Re: [block] 52f019d43c: ndctl.test-libndctl.fail
Date: Fri, 05 Mar 2021 09:38:19 -0500
Message-ID: <x49y2f1aco4.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <20210305074204.GA17414@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============6410788720587164635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Christoph Hellwig <hch@lst.de> writes:

> Dan,
>
> can you make any sense of thos report?
>
> name=3D'nfit_test'
> path=3D'/lib/modules/5.11.0-rc5-00003-g52f019d43c22/extra/test/nfit_test.=
ko'
>> check_set_config_data: dimm: 0 read2 data miscompare: 0
>> check_set_config_data: dimm: 0x1 read2 data miscompare: 0
>> check_set_config_data: dimm: 0x100 read2 data miscompare: 0
>> check_set_config_data: dimm: 0x101 read2 data miscompare: 0
>> check_dax_autodetect: dax_ndns: 0x558a74d92f00 ndns: 0x558a74d92f00
>> check_dax_autodetect: dax_ndns: 0x558a74d91f40 ndns: 0x558a74d91f40
>> check_pfn_autodetect: pfn_ndns: 0x558a74d91f40 ndns: 0x558a74d91f40
>> check_pfn_autodetect: pfn_ndns: 0x558a74d8c5e0 ndns: 0x558a74d8c5e0
>> check_btt_autodetect: btt_ndns: 0x558a74d8c5e0 ndns: 0x558a74d8c5e0
>> check_btt_autodetect: btt_ndns: 0x558a74da1390 ndns: 0x558a74da1390
>> check_btt_autodetect: btt_ndns: 0x558a74d8c5e0 ndns: 0x558a74d8c5e0
>> check_btt_autodetect: btt_ndns: 0x558a74d91f40 ndns: 0x558a74d91f40
>> namespace7.0: failed to write /dev/pmem7
>> check_namespaces: namespace7.0 validate_bdev failed
>> ndctl-test1 failed: -6

This is from test/libndctl.c in the ndctl repo:

        fd =3D open(bdevpath, O_RDONLY);
        if (fd < 0) {
                fprintf(stderr, "%s: failed to open(%s, O_RDONLY)\n",
                                devname, bdevpath);
                return -ENXIO;
        }
...
        ro =3D 0;
        rc =3D ioctl(fd, BLKROSET, &ro);
        if (rc < 0) {
                fprintf(stderr, "%s: BLKROSET failed\n",
                                devname);
                rc =3D -errno;
                goto out;
        }

        close(fd);
        fd =3D open(bdevpath, O_RDWR|O_DIRECT);
...
        if (write(fd, buf, 4096) < 4096) {
                fprintf(stderr, "%s: failed to write %s\n",
                                devname, bdevpath);
                rc =3D -ENXIO;
                goto out;
        }

HTH,
Jeff

--===============6410788720587164635==--

