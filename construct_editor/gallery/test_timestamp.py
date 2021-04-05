import construct as cs
import construct_typed as cst
import dataclasses
import typing as t
import arrow


@dataclasses.dataclass
class Timestamps(cst.TContainerMixin):
    time_int8: arrow.Arrow = cst.sfield(
        cs.Timestamp(cs.Int8ul, unit=1, epoch=arrow.Arrow(2020, 1, 1))
    )
    time_int16: arrow.Arrow = cst.sfield(
        cs.Timestamp(cs.Int16ul, unit=1, epoch=arrow.Arrow(2019, 1, 1))
    )
    time_int32: arrow.Arrow = cst.sfield(
        cs.Timestamp(cs.Int32ul, unit=1, epoch=arrow.Arrow(2080, 1, 1))
    )


constr = cst.TStruct(Timestamps)
binarys = {
    "Zeros": bytes(constr.sizeof()),
    "1": bytes([4, 4, 12]),
    "2": bytes([4, 4, 13]),
    "3": bytes([7, 2, 1]),
}
