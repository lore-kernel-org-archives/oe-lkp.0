Content-Type: multipart/mixed; boundary="===============0166228734804023873=="
MIME-Version: 1.0
From: Deepa B <deepa01012015@gmail.com>
To: lkp@lists.01.org
Subject: Re: IOZone error
Date: Fri, 27 Mar 2020 22:40:19 +0530
Message-ID: <CANmdEh2aSAXKpQSAd3vXrApO3vUYpN2HJqhipEgu1SSSJRJ8-A@mail.gmail.com>
In-Reply-To: <c014659a-bf68-6d42-c586-7eb302316ce0@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0166228734804023873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,
This is the /dev dir listing:

X86: /dev

acpi_thermal_rel fuse loop11 net shm tty22 tty45 ttyS0 ttyS31 vcsa4
autofs gpiochip0 loop12 network_latency snapshot tty23 tty46 ttyS1
ttyS4 vcsa5 block hidraw0 loop13 network_throughput snd tty24 tty47
ttyS10 ttyS5 vcsa6 bsg hpet loop14 null sr0 tty25 tty48 ttyS11 ttyS6
vcsu btrfs-control hugepages loop15 nvram stderr tty26 tty49 ttyS12
ttyS7 vcsu1 bus hwrng loop16 port stdin tty27 tty5 ttyS13 ttyS8 vcsu2
cdrom i2c-0 loop17 ppp stdout tty28 tty50 ttyS14 ttyS9 vcsu3 cdrw
i2c-1 loop18 psaux tpm0 tty29 tty51 ttyS15 udmabuf vcsu4 char i2c-2
loop19 ptmx tpmrm0 tty3 tty52 ttyS16 uhid vcsu5 console i2c-3 loop2
pts tty tty30 tty53 ttyS17 uinput vcsu6 core i2c-4 loop3 random tty0
tty31 tty54 ttyS18 urandom vfio cpu i2c-5 loop4 rfkil tty1 tty32 tty55
ttyS19 userio vga_arbiter cpu_dma_latency i2c-6 loop5 rtc tty10 tty33
tty56 ttyS2 v4l vhci cuse i2c-7 loop6 rtc0 tty11 tty34 tty57 ttyS20
v4l-touch0 vhost-net disk i2c-8 loop7 sda tty12 tty35 tty58 ttyS21 vcs
vhost-vsock dri i2c-9 loop8 sda1 tty13 tty36 tty59 ttyS22 vcs1 video0
drm_dp_aux0 initctl loop9 sda2 tty14 tty37 tty6 ttyS23 vcs2 video1
drm_dp_aux1 input loop-control sda3 tty15 tty38 tty60 ttyS24 vcs3 zero
drm_dp_aux2 kmsg mapper sda4 tty16 tty39 tty61 ttyS25 vcs4 zfs dvd kvm
mcelog sda5 tty17 tty4 tty62 ttyS26 vcs5 dvdrw lightnvm media0 sda6
tty18 tty40 tty63 ttyS27 vcs6 ecryptfs log mei0 sda7 tty19 tty41 tty7
ttyS28 vcsa fb0 loop0 mem sda8 tty2 tty42 tty8 ttyS29 vcsa1 fd loop1
memory_bandwidth sg0 tty20 tty43 tty9 ttyS3 vcsa2 full loop10 mqueue
sg1 tty21 tty44 ttyprintk ttyS30 vcsa3

RISC-V: /dev

autofs loop7 ptya2 ptyc1 ptye0 ptypf ptyre ptytd ptyvc ptyxb ptyza
tty25 tty53 ttyaa ttyc9 ttye8 ttyq7 ttys6 ttyu5 ttyw4 ttyy3 vcs1 block
mem ptya3 ptyc2 ptye1 ptyq0 ptyrf ptyte ptyvd ptyxc ptyzb tty26 tty54
ttyab ttyca ttye9 ttyq8 ttys7 ttyu6 ttyw5 ttyy4 vcs2 char mmcblk0
ptya4 ptyc3 ptye2 ptyq1 ptys0 ptytf ptyve ptyxd ptyzc tty27 tty55
ttyac ttycb ttyea ttyq9 ttys8 ttyu7 ttyw6 ttyy5 vcs3 console mmcblk0p1
ptya5 ptyc4 ptye3 ptyq2 ptys1 ptyu0 ptyvf ptyxe ptyzd tty28 tty56
ttyad ttycc ttyeb ttyqa ttys9 ttyu8 ttyw7 ttyy6 vcs4 cpu_dma_latency
mmcblk0p2 ptya6 ptyc5 ptye4 ptyq3 ptys2 ptyu1 ptyw0 ptyxf ptyze tty29
tty57 ttyae ttycd ttyec ttyqb ttysa ttyu9 ttyw8 ttyy7 vcs5 disk
mmcblk0p3 ptya7 ptyc6 ptye5 ptyq4 ptys3 ptyu2 ptyw1 ptyy0 ptyzf tty3
tty58 ttyaf ttyce

ttyed ttyqc ttysb ttyua ttyw9 ttyy8 vcs6 fd mmcblk0p4 ptya8 ptyc7
ptye6 ptyq5 ptys4 ptyu3 ptyw2 ptyy1 random tty30 tty59 ttyb0 ttycf
ttyee ttyqd ttysc ttyub ttywa ttyy9 vcsa full mqueue ptya9 ptyc8 ptye7
ptyq6 ptys5 ptyu4 ptyw3 ptyy2 shm tty31 tty6 ttyb1 ttyd0 ttyef ttyqe
ttysd ttyuc ttywb ttyya vcsa1 fuse nbd0 ptyaa ptyc9 ptye8 ptyq7 ptys6
ptyu5 ptyw4 ptyy3 snd tty32 tty60 ttyb2 ttyd1 ttyp0 ttyqf ttyse ttyud
ttywc ttyyb vcsa2 hvc0 nbd1 ptyab ptyca ptye9 ptyq8 ptys7 ptyu6 ptyw5
ptyy4 stderr tty33 tty61 ttyb3 ttyd2 ttyp1 ttyr0 ttysf ttyue ttywd
ttyyc vcsa3 hvc1 nbd10 ptyac ptycb ptyea ptyq9 ptys8 ptyu7 ptyw6 ptyy5
stdin tty34 tty62 ttyb4 ttyd3 ttyp2 ttyr1 ttyt0 ttyuf ttywe ttyyd
vcsa4 hvc2 nbd11 ptyad ptycc ptyeb ptyqa ptys9 ptyu8 ptyw7 ptyy6
stdout tty35 tty63 ttyb5 ttyd4 ttyp3 ttyr2 ttyt1 ttyv0 ttywf ttyye
vcsa5 hvc3 nbd12 ptyae ptycd ptyec ptyqb ptysa ptyu9 ptyw8 ptyy7 tty
tty36 tty7 ttyb6 ttyd5 ttyp4 ttyr3 ttyt2 ttyv1 ttyx0 ttyyf vcsa6 hvc4
nbd13 ptyaf ptyce ptyed ptyqc ptysb ptyua ptyw9 ptyy8 tty0 tty37 tty8
ttyb7 ttyd6 ttyp5 ttyr4 ttyt3 ttyv2 ttyx1 ttyz0 vcsu hvc5 nbd14 ptyb0
ptycf ptyee ptyqd ptysc ptyub ptywa ptyy9 tty1 tty38 tty9 ttyb8 ttyd7
ttyp6 ttyr5 ttyt4 ttyv3 ttyx2 ttyz1 vcsu1 hvc6 nbd15 ptyb1 ptyd0 ptyef
ptyqe ptysd ptyuc ptywb ptyya tty10 tty39 ttyS0 ttyb9 ttyd8 ttyp7
ttyr6 ttyt5 ttyv4 ttyx3 ttyz2 vcsu2 hvc7 nbd2 ptyb2 ptyd1 ptyp0 ptyqf
ptyse ptyud ptywc ptyyb tty11 tty4 ttyS1 ttyba ttyd9 ttyp8 ttyr7 ttyt6
ttyv5 ttyx4 ttyz3 vcsu3 hwrng nbd3 ptyb3 ptyd2 ptyp1 ptyr0 ptysf ptyue
ptywd ptyyc tty12 tty40 ttyS2 ttybb ttyda ttyp9 ttyr8 ttyt7 ttyv6
ttyx5 ttyz4 vcsu4 i2c-0 nbd4 ptyb4 ptyd3 ptyp2 ptyr1 ptyt0 ptyuf ptywe
ptyyd tty13 tty41 ttyS3 ttybc ttydb ttypa ttyr9 ttyt8 ttyv7 ttyx6
ttyz5 vcsu5 initctl nbd5 ptyb5 ptyd4 ptyp3 ptyr2 ptyt1 ptyv0 ptywf
ptyye tty14 tty42 ttySIF0 ttybd ttydc ttypb ttyra ttyt9 ttyv8 ttyx7
ttyz6 vcsu6 input nbd6 ptyb6 ptyd5 ptyp4 ptyr3 ptyt2 ptyv1 ptyx0 ptyyf
tty15 tty43 ttySIF1 ttybe ttydd ttypc ttyrb ttyta ttyv9 ttyx8 ttyz7
vga_arbiter kmsg nbd7 ptyb7 ptyd6 ptyp5 ptyr4 ptyt3 ptyv2 ptyx1 ptyz0
tty16 tty44 ttya0 ttybf ttyde ttypd ttyrc ttytb ttyva ttyx9 ttyz8 zero
log nbd ptyb8 ptyd7 ptyp6 ptyr5 ptyt4 ptyv3 ptyx2 ptyz1 tty17 tty45
ttya1 ttyc0 ttydf ttype ttyrd ttytc ttyvb ttyxa ttyz9 loop-control
nbd9 ptyb9 ptyd8 ptyp7 ptyr6 ptyt5 ptyv4 ptyx3 ptyz2 tty18 tty46 ttya2
ttyc1 ttye0 ttypf ttyre ttytd ttyvc ttyxb ttyza loop0 null ptyba ptyd9
ptyp8 ptyr7 ptyt6 ptyv5 ptyx4 ptyz3 tty19 tty47 ttya3 ttyc2 ttye1
ttyq0 ttyrf ttyte ttyvd ttyxc ttyzb loop1 nvme-fabrics ptybb ptyda
ptyp9 ptyr8 ptyt7 ptyv6 ptyx5 ptyz4 tty2 tty48 ttya4 ttyc3 ttye2 ttyq1
ttys0 ttytf ttyve ttyxd ttyzc loop2 port ptybc ptydb ptypa ptyr9 ptyt8
ptyv7 ptyx6 ptyz5 tty20 tty49 ttya5 ttyc4 ttye3 ttyq2

ttys1 ttyu0 ttyvf ttyxe ttyzd loop3 ptmx ptybd ptydc ptypb ptyra ptyt9
ptyv8 ptyx7 ptyz6 tty21 tty5 ttya6 ttyc5 ttye4 ttyq3 ttys2 ttyu1 ttyw0
ttyxf ttyze loop4 pts ptybe ptydd ptypc ptyrb ptyta ptyv9 ptyx8 ptyz7
tty2 tty50 ttya7 ttyc6 ttye5 ttyq4 ttys3 ttyu2 ttyw1 ttyy0 ttyzf loop5
ptya0 ptybf ptyde ptypd ptyrc ptytb ptyva ptyx9 ptyz8 tty23 tty51
ttya8 ttyc7 ttye6 ttyq5 ttys4 ttyu3 ttyw2 ttyy1 urandom loop6 ptya
ptyc0 ptydf ptype ptyrd ptytc ptyvb ptyxa ptyz9 tty24 tty52 ttya9
ttyc8 ttye7 ttyq6 ttys5 ttyu4 ttyw3 ttyy2 vcs

Please let us know if additional info needed.

Thanks,
Deepa

On Fri, 27 Mar 2020 at 15:52, Liu Yiding <yidingx.liu@intel.com> wrote:
>
> Hi,
>
> On 3/27/20 5:58 PM, Deepa B wrote:
> > Hello,
> > Iozone benchmark is run through LKP on X86 (Linux kernel - 5.3.0,
> > Intel(R) Pentium(R) CPU  N3710  @ 1.60GHz) & RISC-V U540(Yocto Linux
> > kernel - 5.4.3). Get same error with HDD disks on both.
> >
> > Command:  lkp run ./iozone-2HDD-ext4-kyber.yaml
> > rm due to not enough HDD disks
> > need: 2, has: 0
>
> This job is filterd by lkp-tests/filters/disk, please ensure your host
> has enough hdd disks.
>
>
> It is possible that lkp can't get your host disks info correctly.
>
> So if your host does have 2 hdd disks, please comment out filters/disk,
> just return 0 as an workaround.
>
> And share us your /dev info, we will fix it asap.
>
>
> > Traceback (most recent call last):
> > 6: from /home/test/Ankita/lkp-tests/bin/run-local:131:in
> >
> > ' 5: from /home/test/Ankita/lkp-tests/lib/job.rb:691:in expand_params'
> > 4: from /home/test/Ankita/lkp-tests/lib/job.rb:77:in for_each_in' 3:
> > from /home/test/Ankita/lkp-tests/lib/job.rb:77:in each'
> > 2: from /home/test/Ankita/lkp-tests/lib/job.rb:78:in block in
> > for_each_in' 1: from /home/test/Ankita/lkp-tests/lib/job.rb:694:in
> > block in expand_params'
> > /home/test/Ankita/lkp-tests/lib/job.rb:669:in `run_filter':
> > /home/test/Ankita/lkp-tests/filters/disk: exitstatus 1
> > (Job::ParamError)
> >
> > Could you please help us resolve this?
> >
> > Thanks,
> > Deepa
> > _______________________________________________
> > LKP mailing list -- lkp(a)lists.01.org
> > To unsubscribe send an email to lkp-leave(a)lists.01.org
>
> --
> Best regards.
> Liu Yiding
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============0166228734804023873==--

