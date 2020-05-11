Content-Type: multipart/mixed; boundary="===============8769827526433439413=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [pipe] f2af7d90e2: xfstests.btrfs.052.fail
Date: Mon, 11 May 2020 12:06:20 +0800
Message-ID: <b6cb98f4-4265-b518-f692-d56d3fb1cad5@intel.com>
In-Reply-To: <20200511011601.GV16070@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8769827526433439413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Matthew

with a quick look into the dmesg
looks this commit broke the preparation of LKP tests

[=C2=A0=C2=A0 32.677588] install debs round two: dpkg -i --force-confdef =

--force-depends /opt/deb/gawk_1%3a4.1.4+dfsg-1_amd64.deb
[ 32.677593]-
[=C2=A0=C2=A0 32.697180] tar: ./control: Cannot write: Invalid argument
[ 32.697184]-
[=C2=A0=C2=A0 32.705025] tar: ./md5sums: Cannot write: Invalid argument
[ 32.705030]-
[=C2=A0=C2=A0 32.710034] tar: ./postinst: Cannot write: Invalid argument
[ 32.710039]-
[=C2=A0=C2=A0 32.743721] tar: ./prerm: Cannot write: Invalid argument

i tried apt command, it also failed with this commit
root(a)vm-snb-186 ~# apt update
Ign:1 http://linux-ftp.sh.intel.com/pub/mirrors/debian stretch InRelease
Get:2 http://linux-ftp.sh.intel.com/pub/mirrors/debian testing InRelease =

[116 kB]
Ign:2 http://linux-ftp.sh.intel.com/pub/mirrors/debian testing InRelease
Get:3 http://linux-ftp.sh.intel.com/pub/mirrors/debian unstable =

InRelease [146 kB]
Ign:3 http://linux-ftp.sh.intel.com/pub/mirrors/debian unstable InRelease
Get:4 http://linux-ftp.sh.intel.com/pub/mirrors/debian stretch Release =

[118 kB]
Err:4 http://linux-ftp.sh.intel.com/pub/mirrors/debian stretch Release
 =C2=A0 Error writing to output file - write (22: Invalid argument)
Get:5 http://linux-ftp.sh.intel.com/pub/mirrors/debian testing Release =

[115 kB]
Err:5 http://linux-ftp.sh.intel.com/pub/mirrors/debian testing Release
 =C2=A0 Error writing to output file - write (22: Invalid argument)
Get:6 http://linux-ftp.sh.intel.com/pub/mirrors/debian unstable Release =

[145 kB]
Get:7 http://linux-ftp.sh.intel.com/pub/mirrors/debian unstable =

Release.gpg [1601 B]
Err:7 http://linux-ftp.sh.intel.com/pub/mirrors/debian unstable Release.gpg
 =C2=A0 Error writing to output file - write (22: Invalid argument)
Reading package lists... Done
E: The repository 'http://linux-ftp.sh.intel.com/pub/mirrors/debian =

stretch Release' does not have a Release file.
N: Updating from such a repository can't be done securely, and is =

therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user =

configuration details.
E: The repository 'http://linux-ftp.sh.intel.com/pub/mirrors/debian =

testing Release' does not have a Release file.
N: Updating from such a repository can't be done securely, and is =

therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user =

configuration details.
E: The repository 'http://linux-ftp.sh.intel.com/pub/mirrors/debian =

unstable Release' is not signed.
N: Updating from such a repository can't be done securely, and is =

therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user =

configuration details.

everything works well without f2af7d90e2 in our environment


Thanks


On 5/11/20 9:16 AM, Matthew Wilcox wrote:
> On Mon, May 11, 2020 at 09:09:57AM +0800, kernel test robot wrote:
>>      --- tests/btrfs/095.out	2020-04-09 10:45:28.000000000 +0800
>>      +++ /lkp/benchmarks/xfstests/results//btrfs/095.out.bad	2020-05-06 =
21:13:51.276485703 +0800
>>      @@ -1,35 +1,9 @@
>>       QA output created by 095
>>      -Blocks modified: [135 - 164]
>>      -Blocks modified: [768 - 792]
>>      +awk: line 19: function strtonum never defined
>>      +awk: line 19: function strtonum never defined
>>      +awk: line 19: function strtonum never defined
>>      +awk: line 19: function strtonum never defined
> This looks like a problem with the test setup.
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

--===============8769827526433439413==--

