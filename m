Content-Type: multipart/mixed; boundary="===============6430923179971934225=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] 8d47a0d8f7: fio.write_bw_MBps -28.6% regression
Date: Fri, 10 Apr 2020 12:14:06 +0200
Message-ID: <20200410101406.GI5920@suse.cz>
In-Reply-To: <a52f10f7-cdf6-9b00-9e49-b1344c17a190@suse.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6430923179971934225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 02:44:55PM +0800, Qu Wenruo wrote:
> On 2020/4/10 =E4=B8=8B=E5=8D=882:34, Xing Zhengjun wrote:
> > Hi Wenruo,
> > =

> > =C2=A0=C2=A0 We test it in v5.6, the issue still exist, do you have tim=
e to take a
> > look at this? Thanks.
> =

> This is expected.
> =

> The extra check brings new overhead mostly equal to another CRC32 run.
> =

> We believe it's worthy, as our read time tree checker has exposed quite
> some bit flip corruption.

The test probably runs on a PMEM device so there's no slowdown from the
actual IO and the in-memory checks are measurable, though 28% is a lot,
I'd expect something like 5-10% at most.
--===============6430923179971934225==--

